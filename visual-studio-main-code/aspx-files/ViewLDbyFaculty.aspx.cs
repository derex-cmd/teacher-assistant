using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class ViewLDbyFaculty : System.Web.UI.Page
    {
        private string FacultyID
        {
            get
            {
                return ViewState["FacultyID"] as string; // Use ViewState to persist the FacultyID across postbacks
            }
            set
            {
                ViewState["FacultyID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FacultyID = Request.QueryString["FacultyID"]; // Retrieve FacultyID from query string
                if (!string.IsNullOrEmpty(FacultyID))
                {
                    LoadLDList();
                }
                else
                {
                    // Handle the case where FacultyID is not available
                }
            }
        }

        private void LoadLDList()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
            {
                string query = "SELECT LD.LDID, C.COURSENAME, COUNT(A.AttendanceID) AS AttendanceCount " +
                    "FROM LabDemonstrators LD INNER JOIN Students S ON LD.StudentID = S.StudentID " +
                    "INNER JOIN Faculty F ON LD.FacultyID = F.FacultyID " +
                    "LEFT JOIN Attendance A ON LD.LDID = A.LDID " +
                    "LEFT JOIN Course C ON LD.FacultyID = C.FacultyID " +
                    "WHERE LD.FacultyID = @FacultyID GROUP BY LD.LDID, C.COURSENAME " +
                    "ORDER BY LD.LDID, C.COURSENAME;";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FacultyID", FacultyID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewLD.DataSource = dt;
                GridViewLD.DataBind();
            }
        }

        protected void RadioButtonSelect_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton selectedRadioButton = (RadioButton)sender;
            GridViewRow row = (GridViewRow)selectedRadioButton.NamingContainer;
            string selectedLD = row.Cells[0].Text;
            Session["SelectedLDID"] = selectedLD; // Storing the selected LD in Session
            lblSelectedLD.Text = "Selected LD: " + selectedLD;

            ClientScript.RegisterStartupScript(this.GetType(), "UncheckRadios", "uncheckOtherRadios(this);", true);
        }

        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {
            if (Session["SelectedLDID"] != null)
            {
                string ldID = Session["SelectedLDID"].ToString();
                string attendanceDate = txtDate.Text;
                string newAttendanceID = GenerateNewAttendanceID();

                if (!string.IsNullOrEmpty(newAttendanceID))
                {
                    InsertAttendanceRecord(newAttendanceID, ldID, attendanceDate);
                    lblMessage.Text = "Attendance marked successfully with AttendanceID: " + newAttendanceID;
                }
                else
                {
                    lblMessage.Text = "Failed to generate a new AttendanceID.";
                }
            }
            else
            {
                lblMessage.Text = "No LD is selected.";
            }
        }

        private string GenerateNewAttendanceID()
        {
            string newAttendanceID = null;
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
            {
                conn.Open();
                string query = "SELECT TOP 1 AttendanceID FROM Attendance ORDER BY AttendanceID DESC";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string lastAttendanceID = reader["AttendanceID"].ToString();
                    int lastID = int.Parse(lastAttendanceID.Substring(1)); // Extract the numeric part
                    int nextID = lastID + 1;
                    newAttendanceID = "A" + nextID.ToString("D3");
                }
                else
                {
                    newAttendanceID = "A001";
                }

                reader.Close();
            }

            return newAttendanceID;
        }

        private void InsertAttendanceRecord(string attendanceID, string ldID, string attendanceDate)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
            {
                conn.Open();
                string query = "INSERT INTO Attendance (AttendanceID, AttendanceDate, LDID, FacultyID) VALUES (@AttendanceID, @AttendanceDate, @LDID, @FacultyID)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@AttendanceID", attendanceID);
                cmd.Parameters.AddWithValue("@AttendanceDate", attendanceDate);
                cmd.Parameters.AddWithValue("@LDID", ldID);
                cmd.Parameters.AddWithValue("@FacultyID", FacultyID);

                cmd.ExecuteNonQuery();

                // refresh the GridView
                LoadLDList();
            }
        }
    }
}
