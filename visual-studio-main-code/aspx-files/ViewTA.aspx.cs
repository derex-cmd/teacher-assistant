using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project_Web
{
    public partial class ViewTA : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");

            try
            {
                string query = @"
            SELECT 
                S.StudentName,
                S.StudentEmail,
                TA.TAID,
                F.FacultyName,
                C.CourseName,
                TA.RatePerStudent,
                TA.TotalStudents
            FROM Faculty F
            INNER JOIN TeacherAssistants TA ON F.FacultyID = TA.FacultyID
            INNER JOIN Students S ON TA.StudentID = S.StudentID
            INNER JOIN Course C ON F.FacultyID = C.FacultyID
            ORDER BY TA.TAID ASC;";

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

        protected string CalculatePayment(object ratePerStudent, object totalStudents)
        {
            if (ratePerStudent != null && totalStudents != null)
            {
                int rate = Convert.ToInt32(ratePerStudent);
                int total = Convert.ToInt32(totalStudents);
                int payment = rate * total;
                return payment.ToString();
            }
            return "N/A"; // Handle null values or invalid data gracefully
        }


        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddTA.aspx");
        }

        protected void btnDeleteStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteTA.aspx");
        }
    }
}
