using System;
using System.Collections.Generic;

namespace GadgetHub.Client
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

    
        protected void btnCamera_Click(object sender, EventArgs e)
        {
            AddToCart(
                productId: 1,
                name: "Camera",
                imageFile: "Camera.jpg"
            );
        }

        protected void btnSpeaker_Click(object sender, EventArgs e)
        {
            AddToCart(
                productId: 2,
                name: "Bluetooth Speaker",
                imageFile: "JBL.jpg"
            );
        }

        protected void btnTablet_Click(object sender, EventArgs e)
        {
            AddToCart(
                productId: 3,
                name: "Tablet",
                imageFile: "Tab.jpg"
            );
        }

        protected void btnHeadset_Click(object sender, EventArgs e)
        {
            AddToCart(
                productId: 4,
                name: "Headset",
                imageFile: "Headset.png"
            );
        }

        private void AddToCart(int productId, string name, string imageFile)
        {
            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();

            var existingItem = cart.Find(item => item.ProductId == productId);
            if (existingItem != null)
            {
                existingItem.Quantity += 1;
            }
            else
            {
                cart.Add(new CartItem
                {
                    ProductId = productId,
                    ProductName = name,
                    ImageUrl = "images/" + imageFile,
                    Quantity = 1,
                    UnitPrice = 0m 
                });
            }

            Session["Cart"] = cart;

            Response.Redirect("Cart.aspx");
        }
        [Serializable]
        public class CartItem
        {
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public int Quantity { get; set; }
            public string ImageUrl { get; set; }
            public decimal UnitPrice { get; set; }
            public decimal TotalPrice => UnitPrice * Quantity;
        }
    }
}
