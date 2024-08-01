using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class ViewLD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");

            try
            {
                string query = @"
            SELECT 
                S.StudentName,
                S.StudentEmail,
                LD.LDID,
                F.FacultyName,
                C.CourseName,
                ISNULL(COUNT(A.AttendanceID), 0) AS Attendance, -- Calculate Attendance
                ISNULL(COUNT(A.AttendanceID) * 3 * LD.RatePerHour, 0) AS Payment -- Calculate Payment
            FROM Faculty F
            INNER JOIN LabDemonstrators LD ON F.FacultyID = LD.FacultyID
            INNER JOIN Students S ON LD.StudentID = S.StudentID
            INNER JOIN Course C ON F.FacultyID = C.FacultyID
            LEFT JOIN Attendance A ON LD.LDID = A.LDID
            GROUP BY S.StudentName, S.StudentEmail, LD.LDID, F.FacultyName, C.CourseName, LD.RatePerHour
            ORDER BY LD.LDID ASC;";

                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                sda.Fill(dataTable);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("An error occurred: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddLD.aspx");
        }

        protected void btnDeleteStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteLD.aspx");
        }
    }
}