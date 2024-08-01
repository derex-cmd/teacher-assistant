using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class ViewAttendanceforLD : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ldID = Request.QueryString["ldID"]; // Retrieve ldID from query string

                if (!string.IsNullOrEmpty(ldID))
                {
                    BindAttendanceData(ldID);
                }
                else
                {
                     //lblMessage.Text = "No LD ID provided.";
                }
            }
        }

        private void BindAttendanceData(string ldID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT F.FacultyName, C.CourseName, A.AttendanceDate, 
                    CASE WHEN A.AttendanceID IS NOT NULL THEN 'Present' ELSE 'Absent' END AS AttendanceStatus
                    FROM LabDemonstrators LD
                    INNER JOIN Faculty F ON LD.FacultyID = F.FacultyID
                    INNER JOIN Course C ON F.FacultyID = C.FacultyID
                    LEFT JOIN Attendance A ON LD.LDID = A.LDID
                    WHERE LD.LDID = @LDID
                    ORDER BY A.AttendanceDate DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@LDID", ldID);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridViewAttendance.DataSource = dt;
                GridViewAttendance.DataBind();
            }
        }
    }
}
