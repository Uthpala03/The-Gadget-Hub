using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Script.Serialization;
using System.Web.UI;
using GadgetHub.Models;

namespace GadgetHub.Client
{
    public partial class ViewOrders : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadOrders();
        }

        private void LoadOrders()
        {
            string apiUrl = "http://localhost:5000/api/vieworders"; 

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    var response = client.GetAsync(apiUrl).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        string json = response.Content.ReadAsStringAsync().Result;
                        var orders = new JavaScriptSerializer().Deserialize<List<Order>>(json);

                        if (orders != null && orders.Count > 0)
                        {
                            gvOrders.DataSource = orders;
                            gvOrders.DataBind();
                            lblError.Visible = false;
                        }
                        else
                        {
                            gvOrders.DataSource = null;
                            gvOrders.DataBind();
                            lblError.Text = "⚠️ No orders found.";
                            lblError.Visible = true;
                        }
                    }
                    else
                    {
                        gvOrders.DataSource = null;
                        gvOrders.DataBind();
                        lblError.Text = "❌ Failed to load order data from the server.";
                        lblError.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                gvOrders.DataSource = null;
                gvOrders.DataBind();
                lblError.Text = "🚨 Error: " + ex.Message;
                lblError.Visible = true;
            }
        }
    }
}
