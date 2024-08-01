using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class LDView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string ldName = textBox1.Text;
            string ldID = textBox2.Text;
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");

            try
            {
                string query = "SELECT LD.LDID FROM LabDemonstrators LD " +
                    "INNER JOIN Students S ON LD.StudentID = S.StudentID" +
                    " WHERE LD.LDID = @LDID AND S.StudentName = @LDName;";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@LDID", ldID);
                cmd.Parameters.AddWithValue("@LDName", ldName);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);

                if (dtable.Rows.Count > 0)
                {
                    Response.Redirect("ViewAttendanceforLD.aspx?LDID=" + ldID);
                }
                else
                {
                    lblMessage.Text = "LD not found!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}
