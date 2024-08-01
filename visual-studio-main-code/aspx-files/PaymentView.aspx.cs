using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;


// got the below error, had three options, either cascade delete so that the record is deleted from the Attendance table as well
// or delete the record from the Attendance table first and then delete the record from the TA or LD table
// or update the Attendance table to set the TAID or LDID to null

// we chose the third option so that previous attendance records are not lost

//Error processing payment: The DELETE statement conflicted with the 
//    REFERENCE constraint "FK__Attendance__LDID__4BAC3F29".The conflict 
//    occurred in database "projectDatabase", table "dbo.Attendance", column 
//    'LDID'.The statement has been terminated.


namespace Project_Web
{
    public partial class PaymentView : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataForTA();
                BindDataForLD();
            }
        }

        private void BindDataForTA()
        {
            string connectionString = @"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False";
            string query = @"
                            SELECT TA.TAID, S.StudentName AS TAName, (TA.RatePerStudent * TA.TotalStudents) AS PaymentDue
                            FROM TeacherAssistants TA
                            INNER JOIN Students S ON TA.StudentID = S.StudentID;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridViewTA.DataSource = dt;
                    GridViewTA.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading TA data: " + ex.Message;
                }
            }
        }

        private void BindDataForLD()
        {
            string connectionString = @"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False";
            string query = @" 
                        SELECT LD.LDID, S.StudentName AS LDName, COUNT(A.AttendanceID) AS LabsAttended, (LD.RatePerHour * 3 * COUNT(A.AttendanceID)) AS PaymentDue
                        FROM LabDemonstrators LD
                        INNER JOIN Students S ON LD.StudentID = S.StudentID
                        LEFT JOIN Attendance A ON LD.LDID = A.LDID
                        GROUP BY LD.LDID, S.StudentName, LD.RatePerHour;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridViewLD.DataSource = dt;
                    GridViewLD.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading LD data: " + ex.Message;
                }
            }
        }

        protected void btnCalculateTotal_Click(object sender, EventArgs e)
        {
            decimal totalPayment = 0;

            // calc total payment for selected TA
            foreach (GridViewRow row in GridViewTA.Rows)
            {
                RadioButton rb = row.FindControl("rbSelectTA") as RadioButton;
                if (rb != null && rb.Checked)
                {
                    decimal paymentDue = Convert.ToDecimal(row.Cells[2].Text);
                    totalPayment += paymentDue;
                }
            }

            // calc total payment for selected LD
            foreach (GridViewRow row in GridViewLD.Rows)
            {
                RadioButton rb = row.FindControl("rbSelectLD") as RadioButton;
                if (rb != null && rb.Checked)
                {
                    decimal paymentDue = Convert.ToDecimal(row.Cells[3].Text);
                    totalPayment += paymentDue;
                }
            }

            lblMessage.Text = "";
            lblTotalPayment.Text = "Total Payment: PKR " + totalPayment.ToString();
        }


        protected void btnFinalizePayment_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False";

            // looping TAs
            foreach (GridViewRow row in GridViewTA.Rows)
            {
                RadioButton rb = row.FindControl("rbSelectTA") as RadioButton;
                if (rb != null && rb.Checked)
                {
                    //lblMessage.Text = "";
                    string taId = row.Cells[0].Text; 
                    ProcessPaymentAndRemove(connectionString, taId, isTA: true);
                    return; 
                }
            }

            // looping LDs
            foreach (GridViewRow row in GridViewLD.Rows)
            {
                RadioButton rb = row.FindControl("rbSelectLD") as RadioButton;
                if (rb != null && rb.Checked)
                {
                    string ldId = row.Cells[0].Text;                         
                    ProcessPaymentAndRemove(connectionString, ldId, isTA: false); // if not TA then LD
                    return; // avoids multiple operations
                }
            }

            lblMessage.Text = "No TA or LD selected for payment.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        private string GetCurrentAdminID()
        {
            string currentAdminID = Session["AdminID"].ToString();
            return currentAdminID;
        }
        private void ProcessPaymentAndRemove(string connectionString, string id, bool isTA)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // determine the table and column name based on TA or LD
                    double totalPayment = 0.0;
                    string tableName, columnIdName, entityType;

                    if (isTA)
                    {
                        tableName = "TeacherAssistants";
                        columnIdName = "TAID";
                        entityType = "TA";

                        // Calculate total payment for TA
                        string queryTA = "SELECT RatePerStudent, TotalStudents FROM TeacherAssistants WHERE TAID = @id";
                        SqlCommand cmdTA = new SqlCommand(queryTA, conn);
                        cmdTA.Parameters.AddWithValue("@id", id);
                        using (SqlDataReader reader = cmdTA.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                int ratePerStudent = Convert.ToInt32(reader["RatePerStudent"]);
                                int totalStudents = Convert.ToInt32(reader["TotalStudents"]);
                                totalPayment = ratePerStudent * totalStudents;
                            }
                        }
                    }
                    
                    else
                    {
                        tableName = "LabDemonstrators";
                        columnIdName = "LDID";
                        entityType = "LD";

                        //// stores previous attendance records for LD, nulls the LDID column which is creating issues
                        //string queryLDAttendance = "UPDATE Attendance SET LDID = NULL WHERE LDID = @id";
                        //SqlCommand cmdLDAttendance = new SqlCommand(queryLDAttendance, conn);
                        //cmdLDAttendance.Parameters.AddWithValue("@id", id);
                        //cmdLDAttendance.ExecuteNonQuery();

                        // delete previous attendance records for LD
                        string queryDeleteAttendance = "DELETE FROM Attendance WHERE LDID = @id";
                        SqlCommand cmdDeleteAttendance = new SqlCommand(queryDeleteAttendance, conn);
                        cmdDeleteAttendance.Parameters.AddWithValue("@id", id);
                        cmdDeleteAttendance.ExecuteNonQuery();

                        // calc total payment for LD
                        string queryLD = "SELECT RatePerHour, COUNT(*) AS LabsAttended FROM LabDemonstrators WHERE LDID = @id GROUP BY RatePerHour";
                        SqlCommand cmdLD = new SqlCommand(queryLD, conn);
                        cmdLD.Parameters.AddWithValue("@id", id);
                        using (SqlDataReader reader = cmdLD.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                double ratePerHour = Convert.ToDouble(reader["RatePerHour"]);
                                int labsAttended = Convert.ToInt32(reader["LabsAttended"]);
                                totalPayment = (ratePerHour * labsAttended) * 3.0;
                                
                            }
                        }
                    }

                    // insert payment record into the Payment table
                    string insertPaymentQuery = "INSERT INTO Payment (LDID, TAID, TotalPayment, ProcessedBy) " +
                                                "VALUES (@LDID, @TAID, @TotalPayment, @ProcessedBy)";
                    SqlCommand cmdPayment = new SqlCommand(insertPaymentQuery, conn);

                    // check if the entity is TA or LD and set parameters accordingly
                    if (entityType == "TA")
                    {
                        cmdPayment.Parameters.AddWithValue("@TAID", id);
                        cmdPayment.Parameters.AddWithValue("@LDID", DBNull.Value); // no LDID for TAs
                    }
                    else 
                    {
                        cmdPayment.Parameters.AddWithValue("@LDID", id);
                        cmdPayment.Parameters.AddWithValue("@TAID", DBNull.Value); // no TAID for LDs
                    }

                    cmdPayment.Parameters.AddWithValue("@TotalPayment", totalPayment);
                    cmdPayment.Parameters.AddWithValue("@ProcessedBy", GetCurrentAdminID());
                    cmdPayment.ExecuteNonQuery();

                    // deleting the TA or LD record from the database
                    string query = $"DELETE FROM {tableName} WHERE {columnIdName} = @id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    
                    lblMessage.Text = "Payment details sent to the Accounts Office successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error processing payment: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }

                // refresh the data in the GridView
                BindDataForTA();
                BindDataForLD();

                // clear the total payment label
                lblTotalPayment.Text = "";
            }
        }
    }
}