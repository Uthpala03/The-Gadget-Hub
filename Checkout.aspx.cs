
using System;
using System.Collections.Generic;
using System.Linq;
using GadgetHub.Models;
using static GadgetHub.Client.Products;

namespace GadgetHub.Client
{
    public partial class Checkout : System.Web.UI.Page
    {
        private readonly Random rnd = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedProduct"] is CartItem product)
                {
                    DisplayQuotations(product.ProductId, product.Quantity);
                }
                else
                {
                    lblMessage.Text = "❌ Unable to proceed. Missing data.";
                    btnCheckout.Visible = false;
                }
            }
        }

        private void DisplayQuotations(int productId, int quantity)
        {
            var quotes = new List<Quote>
            {
                GetQuoteFromTechWorld(productId),
                GetQuoteFromElectroCom(productId),
                GetQuoteFromGadgetCentral(productId)
            };

            foreach (var q in quotes)
            {
                q.TotalPrice = q.Price * quantity;
            }


            gvQuotations.DataSource = quotes;
            gvQuotations.DataBind();

            var bestQuote = quotes
                .Where(q => q.InStock)
                .OrderBy(q => q.TotalPrice)
                .ThenBy(q => q.EstimatedDeliveryDays)
                .FirstOrDefault();

            if (bestQuote != null)
            {
                Session["BestQuote"] = bestQuote;
                lblMessage.Text = $"✅ Best Option: <b>{bestQuote.DistributorName}</b> - LKR {bestQuote.Price:N2} per unit";
                btnCheckout.Visible = true;
            }
            else
            {
                lblMessage.Text = "❌ No available stock from any distributor.";
                btnCheckout.Visible = false;
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["SelectedProduct"] is CartItem product &&
                Session["BestQuote"] is Quote quote)
            {
                Session["ConfirmedProduct"] = product;
                Session["ConfirmedQuote"] = quote;
                Response.Redirect("OrderConfirmation.aspx");
            }
            else
            {
                lblMessage.Text = "❌ Unable to proceed. Missing data.";
            }
        }

        private Quote GetQuoteFromTechWorld(int productId)
        {
            int price;
            switch (productId)
            {
                case 1:
                    price = rnd.Next(92500, 92700);
                    break;
                case 2:
                    price = rnd.Next(18500, 18600);
                    break;
                case 3:
                    price = rnd.Next(53500, 5370000);
                    break;
                case 4:
                    price = rnd.Next(9500, 9600);
                    break;
                default:
                    price = 99999;
                    break;
            }

            return new Quote
            {
                DistributorName = "TechWorld",
                Price = price,
                InStock = rnd.Next(0, 2) == 1,
                EstimatedDeliveryDays = rnd.Next(3, 7)
            };
        }
        private Quote GetQuoteFromElectroCom(int productId)
        {
            int price;
            switch (productId)
            {
                case 1:
                    price = rnd.Next(93500, 93700);
                    break;
                case 2:
                    price = rnd.Next(18990, 19000);
                    break;
                case 3:
                    price = rnd.Next(52750, 52900);
                    break;
                case 4:
                    price = rnd.Next(9499, 9600);
                    break;
                default:
                    price = 99999;
                    break;
            }

            return new Quote
            {
                DistributorName = "ElectroCom",
                Price = price,
                InStock = rnd.Next(0, 2) == 1,
                EstimatedDeliveryDays = rnd.Next(2, 6)
            };
        }
        private Quote GetQuoteFromGadgetCentral(int productId)
        {
            int price;
            switch (productId)
            {
                case 1:
                    price = rnd.Next(92000, 93000);
                    break;
                case 2:
                    price = rnd.Next(19100, 19200);
                    break;
                case 3:
                    price = rnd.Next(52900, 53000);
                    break;
                case 4:
                    price = rnd.Next(9600, 9700);
                    break;
                default:
                    price = 99999;
                    break;
            }

            return new Quote
            {
                DistributorName = "Gadget Central",
                Price = price,
                InStock = rnd.Next(0, 2) == 1,
                EstimatedDeliveryDays = rnd.Next(4, 8)
            };
        }

        protected void gvQuotations_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                var quote = (Quote)e.Row.DataItem;
                var bestQuote = Session["BestQuote"] as Quote;

                if (bestQuote != null && quote.DistributorName == bestQuote.DistributorName)
                {
                    e.Row.CssClass = "highlight";
                }
            }
        }
    }
}
