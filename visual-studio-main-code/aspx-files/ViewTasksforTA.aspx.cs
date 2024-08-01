using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;

namespace Project_Web
{

    public partial class ViewTasksforTA : System.Web.UI.Page
    {
        string taID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                taID = Request.QueryString["TAID"];

                int totalTasks = GetTaskCount(taID, null);
                int completedTasks = GetTaskCount(taID, true);

                lblTotalTasks.Text = "Total Tasks: " + totalTasks;
                lblCompletedTasks.Text = "Completed Tasks: " + completedTasks;

                // Populate the chart
                TaskProgressChart.Series["ProgressSeries"].Points.AddXY("Completed", completedTasks);
                TaskProgressChart.Series["ProgressSeries"].Points.AddXY("Remaining", totalTasks - completedTasks);

                // Set colors for the chart
                //TaskProgressChart.Series["ProgressSeries"].Points[0].Color = System.Drawing.Color.Green;
                //TaskProgressChart.Series["ProgressSeries"].Points[1].Color = System.Drawing.Color.Red;
            }
        }

        private int GetTaskCount(string taID, bool? isCompleted)
        {
            int count = 0;
            string connectionString = @"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False";
            string query = @"SELECT COUNT(*) FROM Tasks WHERE TAID = @TAID";

            if (isCompleted.HasValue)
            {
                query += " AND Scene = " + (isCompleted.Value ? "1" : "0");
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TAID", taID);

                conn.Open();
                count = (int)cmd.ExecuteScalar();
            }

            return count;
        }

        protected void btnViewTasks_Click(object sender, EventArgs e)
        {
            taID = Request.QueryString["TAID"];
            Response.Redirect("TaskListforTA.aspx?TAID=" + taID);
        }
    }
}
