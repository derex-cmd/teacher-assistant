using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace Project_Web
{
    public partial class MostFacultyTask : Page
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
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
            {
                try
                {
                    string query = @"
                        SELECT F.FacultyID, F.FacultyName, TC.TaskCount
                        FROM Faculty F
                        INNER JOIN 
                            (SELECT FacultyID, COUNT(*) AS TaskCount 
                             FROM Tasks
                             GROUP BY FacultyID) AS TC
                        ON F.FacultyID = TC.FacultyID
                        ORDER BY TC.TaskCount DESC";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    sda.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        GridViewMostTasks.DataSource = dataTable;
                        GridViewMostTasks.DataBind();
                        lblMessage.Text = "Data loaded successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "No data found.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error occurred: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
