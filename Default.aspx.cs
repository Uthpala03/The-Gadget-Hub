using System;

namespace GadgetHub.Client
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnOrderNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx"); 
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }


        protected void btnViewOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewOrders.aspx");
        }

    }
}
