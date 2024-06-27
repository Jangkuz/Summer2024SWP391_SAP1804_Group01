using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Helper
{
    public class WarrantyCardQuery
    {
        public long? WarrantyCardId { get; set; } = 0;
        public long? DiamondId { get; set; } = 0;
        public long? AccessoryId { get; set; } = 0;
        public long? CustomerId { get; set; } = 0;
        public DateTime? MinDate { get; set; } = null;
        public DateTime? MaxDate { get; set; } = null;
        public int PageSize { get; set; } = 5;
        public int PageNumber { get; set; } = 1;
    }
}
