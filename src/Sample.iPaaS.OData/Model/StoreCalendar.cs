namespace Sample.iPaaS.OData.Model
{
    public class StoreCalendar
    {
        public int StoreId { get; set; }
        public DateTime? Date { get; set; }
        public string? Opening { get; set; }
        public string? DayType { get; set; }
        public string? Reason { get; set; }
        public string? Comment { get; set; }
    }
}
