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
    public partial class Faculty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            string FacultyName = textBox3.Text;
            string FacultyID = textBox4.Text;
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");

            try
            {
                string query = "SELECT * FROM Faculty WHERE FacultyName = @FacultyName AND FacultyID = @FacultyID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FacultyName", FacultyName);
                cmd.Parameters.AddWithValue("@FacultyID", FacultyID);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);

                if (dtable.Rows.Count > 0)
                {
                    // Teacher found - redirect to ViewFaculty page with FacultyID as a query string
                    Response.Redirect("FacultyView.aspx?FacultyID=" + FacultyID);
                }
                else
                {
                    lblMessage.Text = "Teacher not found!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}