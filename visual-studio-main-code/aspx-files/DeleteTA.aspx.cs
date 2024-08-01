using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class DeleteTA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDeleteTA_Click(object sender, EventArgs e)
        {
            string taIdToDelete = txtDeleteTAID.Text;
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");

            try
            {
                conn.Open();

                // Check if TA exists
                string checkQuery = "SELECT COUNT(*) FROM TeacherAssistants WHERE TAID = @TAID";
                SqlCommand cmdCheck = new SqlCommand(checkQuery, conn);
                cmdCheck.Parameters.AddWithValue("@TAID", taIdToDelete);

                int exists = (int)cmdCheck.ExecuteScalar();

                if (exists > 0)
                {
                    // Delete the TA
                    string deleteQuery = "DELETE FROM TeacherAssistants WHERE TAID = @TAID";
                    SqlCommand cmdDelete = new SqlCommand(deleteQuery, conn);
                    cmdDelete.Parameters.AddWithValue("@TAID", taIdToDelete);

                    cmdDelete.ExecuteNonQuery();

                    lblDeleteMessage.ForeColor = System.Drawing.Color.Green;
                    lblDeleteMessage.Text = "TA successfully deleted from the database.";
                }
                else
                {
                    lblDeleteMessage.ForeColor = System.Drawing.Color.Red;
                    lblDeleteMessage.Text = "TA not found in the database.";
                }
            }
            catch (Exception ex)
            {
                lblDeleteMessage.ForeColor = System.Drawing.Color.Red;
                lblDeleteMessage.Text = "An error occurred: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}