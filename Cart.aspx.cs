using GadgetHub.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using static GadgetHub.Client.Products;

namespace GadgetHub.Client
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
                LoadBestQuotations();
            }
        }

       
        private void BindCart()
        {
            var cart = Session["Cart"] as List<CartItem>;

            if (cart == null || cart.Count == 0)
            {
                gvCart.DataSource = null;
                gvCart.DataBind();
                lblQuoteGrandTotal.Text = "🛒 Your cart is empty.";
                gvBestQuotes.Visible = false;
                return;
            }

            gvCart.DataSource = cart;
            gvCart.DataBind();
        }

       
        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            var cart = Session["Cart"] as List<CartItem>;

            if (cart == null) return;

            var item = cart.FirstOrDefault(c => c.ProductId == productId);
            if (item == null) return;

            if (e.CommandName == "Increase")
            {
                item.Quantity += 1;
            }
            else if (e.CommandName == "Decrease")
            {
                item.Quantity -= 1;
                if (item.Quantity <= 0)
                {
                    cart.Remove(item); 
                }
            }
            else if (e.CommandName == "Compare")
            {
                Session["SelectedProduct"] = item;
                Response.Redirect("Checkout.aspx");
                return;
            }

            Session["Cart"] = cart;
            BindCart();
            LoadBestQuotations(); 
        }


        private void LoadBestQuotations()
        {
            var cart = Session["Cart"] as List<CartItem>;
            if (cart == null || cart.Count == 0)
            {
                gvBestQuotes.Visible = false;
                lblQuoteGrandTotal.Text = "";
                return;
            }

            var orderRequests = cart.Select(item => new OrderRequest
            {
                ProductId = item.ProductId,
                Quantity = item.Quantity
            }).ToList();

            string apiUrl = "http://localhost:5000/api/order/getbestquotations";

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));

                var response = client.PostAsJsonAsync(apiUrl, orderRequests).Result;

                if (response.IsSuccessStatusCode)
                {
                    string jsonData = response.Content.ReadAsStringAsync().Result;
                    var bestQuotes = new JavaScriptSerializer().Deserialize<List<BestQuotation>>(jsonData);

                    var quoteDisplay = bestQuotes.Select(quote =>
                    {
                        int quantity = cart.FirstOrDefault(c => c.ProductId == quote.ProductId)?.Quantity ?? 1;
                        return new QuoteDisplay
                        {
                            ProductId = quote.ProductId,
                            DistributorName = quote.DistributorName,
                            Quantity = quantity,
                            UnitPrice = quote.UnitPrice,
                            EstimatedDeliveryDays = quote.EstimatedDeliveryDays
                        };
                    }).ToList();

                    gvBestQuotes.DataSource = quoteDisplay;
                    gvBestQuotes.DataBind();
                    gvBestQuotes.Visible = true;

                    decimal totalLKR = quoteDisplay.Sum(q => q.TotalPrice);
                    lblQuoteGrandTotal.Text = "Grand Total: LKR " + totalLKR.ToString("N2");
                }
                else
                {
                    gvBestQuotes.Visible = false;
                    lblQuoteGrandTotal.Text = "❌ Could not load quotations.";
                }
            }
        }

        
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            var cart = Session["Cart"] as List<CartItem>;

            if (cart == null || cart.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your cart is empty.');", true);
                return;
            }

            var orderRequests = cart.Select(item => new OrderRequest
            {
                ProductId = item.ProductId,
                Quantity = item.Quantity
            }).ToList();

            string apiUrl = "http://localhost:5000/api/order/placeorder";

            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));

                var response = client.PostAsJsonAsync(apiUrl, orderRequests).Result;

                if (response.IsSuccessStatusCode)
                {
                    string json = response.Content.ReadAsStringAsync().Result;
                    var confirmations = new JavaScriptSerializer().Deserialize<List<OrderConfirmation>>(json);

                    Session["PlacedOrders"] = confirmations;

                  
                    Session["SelectedProduct"] = cart.First();

                    Session["Cart"] = null;

                    Response.Redirect("Checkout.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('❌ Failed to place order.');", true);
                }
            }
        }

    
        public class QuoteDisplay
        {
            public int ProductId { get; set; }
            public string DistributorName { get; set; }
            public int Quantity { get; set; }
            public decimal UnitPrice { get; set; }
            public decimal TotalPrice => UnitPrice * Quantity;
            public int EstimatedDeliveryDays { get; set; }
        }
    }
}
