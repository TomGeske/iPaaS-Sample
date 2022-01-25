namespace Sample.iPaaS.OData.Model
{
    public class DiscountedProduct
    {
        public int? ProductId { get; set; }
        public double? DiscountPrice { get; set; }
        public DateTime? PriceValidUntil { get; set; }
    }
}
