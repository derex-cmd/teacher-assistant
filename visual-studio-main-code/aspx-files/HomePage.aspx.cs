using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Web
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }

        protected void FacultyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Faculty.aspx");
        }

        protected void TAButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("TAView.aspx");
        }

        protected void LDButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LDView.aspx");
        }
    }
}
