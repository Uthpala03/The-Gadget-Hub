using System;
using System.ComponentModel.DataAnnotations;


namespace GadgetHub.Models
{
    public class OrderConfirmation
    {
        public int OrderId { get; set; }  
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public string DistributorName { get; set; }
        public int EstimatedDeliveryDays { get; set; }
        public DateTime OrderDate { get; set; }
    }


}
