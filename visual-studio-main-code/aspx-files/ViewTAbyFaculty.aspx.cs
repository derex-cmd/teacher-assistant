using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class ViewTAbyFaculty : System.Web.UI.Page
    {
        private string FacultyID
        {
            get { return ViewState["FacultyID"] as string; }
            set { ViewState["FacultyID"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FacultyID = Request.QueryString["FacultyID"];
                if (!string.IsNullOrEmpty(FacultyID))
                {
                    LoadTAList();
                }
                else
                {
                    lblMessage.Text = "Faculty ID is missing.";
                }
            }
        }

        private void LoadTAList()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
                {
                    string query = @"SELECT TA.TAID, C.COURSENAME, T.TaskID, T.Details, 
                             CASE WHEN T.Scene = 1 THEN 'Complete' ELSE 'Incomplete' END AS Scene 
                             FROM TeacherAssistants TA 
                             INNER JOIN Course C ON TA.FacultyID = C.FacultyID 
                             LEFT JOIN Tasks T ON TA.TAID = T.TAID 
                             WHERE TA.FacultyID = @FacultyID;";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@FacultyID", FacultyID);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridViewTA.DataSource = dt;
                    GridViewTA.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading TA list: " + ex.Message;
            }
        }

        protected void RadioButtonSelect_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridViewTA.Rows)
            {
                RadioButton rbSelect = (RadioButton)row.FindControl("RadioButtonSelect");
                if (rbSelect != null && rbSelect.Checked)
                {
                    string selectedTAID = GridViewTA.DataKeys[row.RowIndex].Value.ToString();
                    lblSelectedTA.Text = "Selected TA: " + selectedTAID;
                    return;
                }
            }
        }

        protected void btnAssignTask_Click(object sender, EventArgs e)
        {

            string selectedTAID = null;
            selectedTAID = lblSelectedTA.Text.Replace("Selected TA: ", "");
            foreach (GridViewRow row in GridViewTA.Rows)
            {
                RadioButton rbSelect = (RadioButton)row.FindControl("RadioButtonSelect");
                if (rbSelect != null && rbSelect.Checked)
                {
                    selectedTAID = GridViewTA.DataKeys[row.RowIndex].Value.ToString();
                    break;
                }
            }

            if (!string.IsNullOrEmpty(selectedTAID))
            {
                string newTaskID = GenerateNewTaskID();
                string taskDetails = txtTaskDetails.Text;

                if (!string.IsNullOrEmpty(newTaskID) && !string.IsNullOrEmpty(taskDetails))
                {
                    // Insert the new task record into the database
                    InsertTaskRecord(newTaskID, taskDetails, selectedTAID);
                    lblSuccessMessage.Text = "Task assigned successfully with TaskID: " + newTaskID;
                }
                else
                {
                    lblMessage.Text = "Failed to generate a new TaskID or task details are missing.";
                }
            }
            else
            {
                lblMessage.Text = "No TA is selected.";
            }
        }

        private string GenerateNewTaskID()
        {
            string newTaskID = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
                {
                    conn.Open();
                    string query = "SELECT TOP 1 TaskID FROM Tasks ORDER BY TaskID DESC";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string lastTaskID = reader["TaskID"].ToString();
                        int lastID = int.Parse(lastTaskID.Substring(1)); // extract the numeric part only
                        int nextID = lastID + 1;
                        newTaskID = "T" + nextID.ToString("D3"); // minimum of three digits
                    }
                    else
                    {
                        newTaskID = "T001";
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error generating Task ID: " + ex.Message;
            }

            return newTaskID;
        }

        private void InsertTaskRecord(string taskID, string details, string taID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
                {
                    conn.Open();
                    // Updated query to include TAID
                    string query = "INSERT INTO Tasks (TaskID, Details, Scene, FacultyID, TAID) VALUES (@TaskID, @Details, 0, @FacultyID, @TAID)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@TaskID", taskID);
                    cmd.Parameters.AddWithValue("@Details", details);
                    cmd.Parameters.AddWithValue("@FacultyID", FacultyID);
                    cmd.Parameters.AddWithValue("@TAID", taID); // Add TAID to the parameters

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error assigning task: " + ex.Message;
            }
        }


        protected void GridViewTA_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Convert Scene bit to human-readable status
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                bool scene = Convert.ToBoolean(rowView["Scene"]);
                e.Row.Cells[4].Text = scene ? "Complete" : "Incomplete";
            }
        }
    }
}
