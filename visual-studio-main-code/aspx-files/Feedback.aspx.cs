using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class Feedback : System.Web.UI.Page
    {
        string facultyID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                facultyID = Request.QueryString["facultyID"];
                BindStudentDetails();
            }
        }

        private void BindStudentDetails()
        {
            facultyID = Request.QueryString["facultyID"];

            string query = @"
                SELECT 
                    CASE 
                        WHEN TA.TAID IS NOT NULL THEN 'TA-' + TA.TAID 
                        WHEN LD.LDID IS NOT NULL THEN 'LD-' + LD.LDID 
                        ELSE 'N/A' 
                    END AS StudentID,
                    S.StudentName,
                    C.CourseName,
                    ISNULL((SELECT COUNT(*) FROM Tasks WHERE TAID = TA.TAID), 0) AS TotalTasks,
                    ISNULL((SELECT COUNT(*) FROM Tasks WHERE TAID = TA.TAID AND Scene = 1), 0) AS CompletedTasks,
                    ISNULL((SELECT COUNT(*) FROM Attendance WHERE LDID = LD.LDID), 0) AS AttendanceCount
                FROM Students S
                LEFT JOIN TeacherAssistants TA ON S.StudentID = TA.StudentID AND TA.FacultyID = @FacultyID
                LEFT JOIN LabDemonstrators LD ON S.StudentID = LD.StudentID AND LD.FacultyID = @FacultyID
                LEFT JOIN Course C ON TA.FacultyID = C.FacultyID OR LD.FacultyID = C.FacultyID
                WHERE TA.FacultyID = @FacultyID OR LD.FacultyID = @FacultyID";
                                                                   

            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FacultyID", facultyID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewTALD.DataSource = dt;
                GridViewTALD.DataBind();
            }
        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            string studentID = txtStudentID.Text;
            facultyID = Request.QueryString["facultyID"];
            string feedbackText = txtFeedback.Text;

            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False"))
                {
                    conn.Open();

                    // Validation query to check if the student is associated with the faculty
                    string validationQuery = @"
                SELECT COUNT(*) FROM Students S
                LEFT JOIN TeacherAssistants TA ON S.StudentID = TA.StudentID
                LEFT JOIN LabDemonstrators LD ON S.StudentID = LD.StudentID
                WHERE (TA.FacultyID = @FacultyID OR LD.FacultyID = @FacultyID) AND (TA.TAID = @StudentID OR LD.LDID = @StudentID)";

                    SqlCommand validationCmd = new SqlCommand(validationQuery, conn);
                    validationCmd.Parameters.AddWithValue("@FacultyID", facultyID);
                    validationCmd.Parameters.AddWithValue("@StudentID", studentID);

                    int count = Convert.ToInt32(validationCmd.ExecuteScalar());

                    // Only insert feedback if the student is associated with the faculty
                    if (count > 0)
                    {
                        string query = "INSERT INTO StudentFeedback (StudentID, FacultyID, FeedbackText) VALUES (@StudentID, @FacultyID, @FeedbackText)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@StudentID", studentID);
                        cmd.Parameters.AddWithValue("@FacultyID", facultyID);
                        cmd.Parameters.AddWithValue("@FeedbackText", feedbackText);

                        int result = cmd.ExecuteNonQuery();
                        if (result > 0)
                        {
                            lblMessage.Text = "Feedback submitted successfully for Student ID: " + studentID;
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "Failed to submit feedback.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblMessage.Text = "You are not authorized to submit feedback for this student.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }



    }
}
