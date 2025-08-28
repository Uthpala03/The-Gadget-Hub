using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GadgetHub.Models
{
    public class BestQuotation
    {
        public int ProductId { get; set; }
        public string DistributorName { get; set; }
        public decimal UnitPrice { get; set; }
        public int EstimatedDeliveryDays { get; set; }
    }
}

