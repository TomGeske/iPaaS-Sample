using System.Diagnostics.CodeAnalysis;

namespace Sample.iPaaS.OData.Model
{
    public class Store
    {
        public int StoreId { get; set; }
        public string StoreName { get; set; }
        public string Canton { get; set; }
        public string Streeet { get; set; }
        public Int16 PLZ { get; set; }
        public string City { get; set; }
        public string StoreType { get; set; }
        public int WeekKalendarId { get; set; }
    }
}
