using System;
using System.ComponentModel.DataAnnotations;

namespace GadgetHub.Models
{
    public class OrderRequest
    {
        [Required]
        public int ProductId { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Quantity must be at least 1")]
        public int Quantity { get; set; }
    }
    public class Quote
    {
        public string DistributorName { get; set; }
        public decimal Price { get; set; }
        public bool InStock { get; set; }
        public int EstimatedDeliveryDays { get; set; }

        public decimal TotalPrice { get; set; } 
        public string InStockText => InStock ? " In Stock" : " Out of Stock";

    }
    public class QuotationRequest
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
    public class QuotationResponse
    {
        public int ProductId { get; set; }
        public decimal UnitPrice { get; set; }
        public int AvailableQuantity { get; set; }
        public int EstimatedDeliveryDays { get; set; }
        public string DistributorName { get; set; }
    }

    public class Order
    {
        [Key]
        public int OrderId { get; set; }

        [Required]
        public int ProductId { get; set; }

       

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "Quantity must be positive")]
        public int Quantity { get; set; }

        [Required]
        [Range(0.01, double.MaxValue, ErrorMessage = "Unit price must be positive")]
        public decimal UnitPrice { get; set; }

        [Required]
        [Range(0.01, double.MaxValue, ErrorMessage = "Total price must be positive")]
        public decimal TotalPrice { get; set; }

        [Required]
        [StringLength(100)]
        public string DistributorName { get; set; }

        [Required]
        [Range(1, 60, ErrorMessage = "Delivery days must be between 1 and 60")]
        public int EstimatedDeliveryDays { get; set; }

        [Required]
        public DateTime OrderDate { get; set; } = DateTime.Now;
    }
}
