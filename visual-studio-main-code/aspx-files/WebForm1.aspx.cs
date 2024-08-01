using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Project_Web
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Unnamed5_Click(object sender, EventArgs e)
        {
            // storing the current session's admin name for paymentLogTable
            Session["AdminID"] = textBox2.Text;

            string adminName = textBox1.Text;
            string adminID = textBox2.Text;
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");


            try
            {
                string query = "SELECT * FROM ADMIN WHERE AdminName = @AdminName AND AdminID = @AdminID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@AdminName", adminName);
                cmd.Parameters.AddWithValue("@AdminID", adminID);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);

                if (dtable.Rows.Count > 0)
                {
                    lblMessage.Text = "Admin found! Welcome!";
                    Response.Redirect("AdminView.aspx");
                }
                else
                {
                    lblMessage.Text = "Admin not found!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}
