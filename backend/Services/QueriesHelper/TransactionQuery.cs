namespace backend.Services.QueriesHelper
{
    public class TransactionQuery
    {
        public string? SearchOrderId { get; set; } = string.Empty;
        public int? PageSize { get; set; }
        public int? PageNumber { get; set; }
    }
}
