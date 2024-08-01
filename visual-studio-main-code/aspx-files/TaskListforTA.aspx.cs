using System;
using System.Data.SqlClient;
using System.Data;

namespace Project_Web
{
    public partial class TaskListforTA : System.Web.UI.Page
    {
        string taID; 
        private string connectionString = @"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                taID = Request.QueryString["TAID"]; // Retrieve taID from query string
                if (!string.IsNullOrEmpty(taID))
                {
                    BindTasksToGridView();
                }
                else
                {
                    
                }
            }
        }

        private void BindTasksToGridView()
        {
            string query = @"SELECT TaskID, Details, CASE WHEN Scene = 0 THEN 'Incomplete' ELSE 'Complete' END AS Scene 
                             FROM Tasks WHERE TAID = @TAID";
            taID = Request.QueryString["TAID"];
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TAID", taID);

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewTasks.DataSource = dt;
                GridViewTasks.DataBind();
            }
        }

        protected void btnMarkComplete_Click(object sender, EventArgs e)
        {
            string taskID = txtTaskID.Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                taID = Request.QueryString["TAID"];
                SqlCommand cmd = new SqlCommand("UPDATE Tasks SET Scene = 1 WHERE TaskID = @TaskID AND TAID = @TAID", conn);
                cmd.Parameters.AddWithValue("@TaskID", taskID);
                cmd.Parameters.AddWithValue("@TAID", taID);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblSuccessMessage.Text = "Task marked as complete.";
                    lblErrorMessage.Text = "";
                    BindTasksToGridView();
                }
                else
                {
                    lblErrorMessage.Text = "Task not found or already completed.";
                    lblSuccessMessage.Text = "";
                }
            }
        }
    }
}
