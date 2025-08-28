using GadgetHub.Models;
using System;
using System.Web.UI;
using static GadgetHub.Client.Products;

namespace GadgetHub.Client
{
    public partial class OrderConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ConfirmedProduct"] is CartItem product &&
                    Session["ConfirmedQuote"] is Quote quote)
                {
                    lblProduct.Text = product.ProductName;
                    lblQuantity.Text = product.Quantity.ToString();
                    lblDistributor.Text = quote.DistributorName;
                    lblUnitPrice.Text = quote.Price.ToString("N2");
                    lblTotal.Text = (quote.Price * product.Quantity).ToString("N2");

                    lblSuccess.Text = "✅ Your order has been successfully confirmed!";
                    lblSuccess.Visible = true;
                    lblError.Visible = false;
                }
                else
                {
                    lblError.Text = "❌ Order details are missing. Please try again.";
                    lblError.Visible = true;
                    lblSuccess.Visible = false;
                }
            }
        }

        protected void btnViewOrderHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewOrders.aspx");
        }
    }
}
