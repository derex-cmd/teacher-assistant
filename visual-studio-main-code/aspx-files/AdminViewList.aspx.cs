using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project_Web
{
    public partial class AdminViewList : Page
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
                    F.FacultyName, 
                    F.FacultyEmail, 
                    C.COURSENAME AS COURSENAME, 
                    CASE WHEN TA.TAID IS NULL THEN 'Not Assigned' ELSE TA.TAID END AS TAID, 
                    CASE WHEN LD.LDID IS NULL THEN 'Not Assigned' ELSE LD.LDID END AS LDID
                    FROM Faculty F
                    LEFT JOIN Course C ON F.FacultyID = C.FacultyID
                    LEFT JOIN TeacherAssistants TA ON F.FacultyID = TA.FacultyID
                    LEFT JOIN LabDemonstrators LD ON F.FacultyID = LD.FacultyID;
                ";


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
            conn.Close();
        }
    }
}
