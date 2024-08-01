using System;
using System.Web.UI;

namespace Project_Web
{
    public partial class AdminView : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnViewList_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminViewList.aspx");
        }

        protected void btnViewTA_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewTA.aspx");
        }

        protected void btnViewLD_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewLD.aspx");
        }

        protected void btnProcessPayments_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentView.aspx");
        }

        protected void btnMostFacultyTasks_Click(object sender, EventArgs e)
        {
            Response.Redirect("MostFacultyTask.aspx");
        }
    }
}
