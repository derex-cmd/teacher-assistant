using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class TAView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            string taName = textBox3.Text;
            string taID = textBox4.Text;
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");

            try
            {
                string query = "SELECT TA.TAID FROM TeacherAssistants TA INNER JOIN Students S ON TA.StudentID = S.StudentID WHERE TA.TAID = @TAID AND S.StudentName = @TAName;";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TAID", taID);
                cmd.Parameters.AddWithValue("@TAName", taName);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);

                if (dtable.Rows.Count > 0)
                {
                    Response.Redirect("ViewTasksforTA.aspx?TAID=" + taID);
                }
                else
                {
                    lblMessage.Text = "TA not found!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}
