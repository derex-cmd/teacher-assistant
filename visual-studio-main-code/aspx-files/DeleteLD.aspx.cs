using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project_Web
{
    public partial class DeleteLD : Page
    {
        protected void btnDeleteLD_Click(object sender, EventArgs e)
        {
            string ldIdToDelete = txtDeleteLDID.Text.Trim();
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");

            try
            {
                conn.Open();

                // Delete attendance records for the LD from Attendance table
                string deleteAttendanceQuery = "DELETE FROM Attendance WHERE LDID = @LDID";
                SqlCommand cmdDeleteAttendance = new SqlCommand(deleteAttendanceQuery, conn);
                cmdDeleteAttendance.Parameters.AddWithValue("@LDID", ldIdToDelete);

                cmdDeleteAttendance.ExecuteNonQuery();

                // Delete the LD from LabDemonstrators table
                string deleteLDQuery = "DELETE FROM LabDemonstrators WHERE LDID = @LDID";
                SqlCommand cmdDeleteLD = new SqlCommand(deleteLDQuery, conn);
                cmdDeleteLD.Parameters.AddWithValue("@LDID", ldIdToDelete);

                cmdDeleteLD.ExecuteNonQuery();

                lblDeleteMessage.ForeColor = System.Drawing.Color.Green;
                lblDeleteMessage.Text = "LD and associated attendance records successfully deleted from the database.";
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
