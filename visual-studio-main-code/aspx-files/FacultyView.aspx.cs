using System;
using System.Web.UI;

namespace Project_Web
{
    public partial class ViewFaculty : Page
    {
        private string FacultyID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve FacultyID from query string
            FacultyID = Request.QueryString["FacultyID"];
        }

        protected void btnManageTA_Click(object sender, EventArgs e)
        {
            // Redirect to ManageTA page with FacultyID
            Response.Redirect($"ViewTAbyFaculty.aspx?FacultyID={FacultyID}");
        }

        protected void btnManageLD_Click(object sender, EventArgs e)
        {
            // Redirect to ManageLD page with FacultyID
            Response.Redirect($"ViewLDbyFaculty.aspx?FacultyID={FacultyID}");
        }

        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            // Redirect to Feedback page with FacultyID
            Response.Redirect($"Feedback.aspx?FacultyID={FacultyID}");
        }
    }
}
