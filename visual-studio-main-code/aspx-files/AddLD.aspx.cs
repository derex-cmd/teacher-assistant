using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class AddLD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegisterLD_Click(object sender, EventArgs e)
        {
            string taId = txtLDID.Text;
            string studentId = txtStudentID.Text;
            int RatePerHour = Convert.ToInt32(txtRatePerHour.Text);
            string facultyId = txtFacultyID.Text;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");
            try
            {
                conn.Open();

                // Check if TA already exists
                string checkTASQL = "SELECT COUNT(*) FROM LabDemonstrators WHERE LDID = @LDID";
                SqlCommand cmdCheckTA = new SqlCommand(checkTASQL, conn);
                cmdCheckTA.Parameters.AddWithValue("@LDID", taId);
                int taExists = (int)cmdCheckTA.ExecuteScalar();

                if (taExists > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "LD already exists in the database.";
                }
                else
                {
                    // Check if the student exists
                    string checkStudentSQL = "SELECT COUNT(*) FROM Students WHERE StudentID = @StudentID";
                    SqlCommand cmdCheckStudent = new SqlCommand(checkStudentSQL, conn);
                    cmdCheckStudent.Parameters.AddWithValue("@StudentID", studentId);
                    int studentExists = (int)cmdCheckStudent.ExecuteScalar();

                    if (studentExists == 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Student does not exist in the database.";
                    }
                    else
                    {
                        // Insert new TA
                        string insertQuery = "INSERT INTO LabDemonstrators (LDID, StudentID, RatePerHour, FacultyID) VALUES (@TAID, @StudentID, @RatePerHour, @FacultyID)";
                        SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);
                        cmdInsert.Parameters.AddWithValue("@TAID", taId);
                        cmdInsert.Parameters.AddWithValue("@StudentID", studentId);
                        cmdInsert.Parameters.AddWithValue("@RatePerHour", RatePerHour);
                        //cmdInsert.Parameters.AddWithValue("@TotalStudents", totalStudents);
                        cmdInsert.Parameters.AddWithValue("@FacultyID", facultyId);

                        cmdInsert.ExecuteNonQuery();

                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "LD successfully added to the database.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}