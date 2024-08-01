using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;

namespace Project_Web
{
    public partial class AddTA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegisterTA_Click(object sender, EventArgs e)
        {
            string taId = txtTAID.Text;
            string studentId = txtStudentID.Text;
            int ratePerStudent = Convert.ToInt32(txtRatePerStudent.Text);
            int totalStudents = Convert.ToInt32(txtTotalStudents.Text);
            string facultyId = txtFacultyID.Text;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6VB53BE\SQLEXPRESS;Initial Catalog=projectDatabase;Integrated Security=True;Encrypt=False");
            try
            {
                conn.Open();

                // check if TA already exists
                string checkTASQL = "SELECT COUNT(*) FROM TeacherAssistants WHERE TAID = @TAID";
                SqlCommand cmdCheckTA = new SqlCommand(checkTASQL, conn);
                cmdCheckTA.Parameters.AddWithValue("@TAID", taId);
                int taExists = (int)cmdCheckTA.ExecuteScalar();

                if (taExists > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "TA already exists in the database.";
                }
                else
                {
                    // check if the student exists
                    string checkStudentSQL = "SELECT COUNT(*) FROM Students WHERE StudentID = @StudentID";
                    SqlCommand cmdCheckStudent = new SqlCommand(checkStudentSQL, conn);
                    cmdCheckStudent.Parameters.AddWithValue("@StudentID", studentId);
                    int studentExists = (int)cmdCheckStudent.ExecuteScalar();

                    if (studentExists == 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Student does not exist in the database.";
                    }
                    else
                    {
                        // insert new TA
                        string insertQuery = "INSERT INTO TeacherAssistants (TAID, StudentID, RatePerStudent, TotalStudents, FacultyID) VALUES (@TAID, @StudentID, @RatePerStudent, @TotalStudents, @FacultyID)";
                        SqlCommand cmdInsert = new SqlCommand(insertQuery, conn);
                        cmdInsert.Parameters.AddWithValue("@TAID", taId);
                        cmdInsert.Parameters.AddWithValue("@StudentID", studentId);
                        cmdInsert.Parameters.AddWithValue("@RatePerStudent", ratePerStudent);
                        cmdInsert.Parameters.AddWithValue("@TotalStudents", totalStudents);
                        cmdInsert.Parameters.AddWithValue("@FacultyID", facultyId);

                        cmdInsert.ExecuteNonQuery();

                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "TA successfully added to the database.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }



    }
}