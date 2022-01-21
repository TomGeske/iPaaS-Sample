using System.Diagnostics.CodeAnalysis;

namespace Sample.iPaaS.OData.Model
{
    public class Store
    {
        public int StoreId { get; set; }
        public string StoreName { get; set; } = String.Empty;
        public string Canton { get; set; } = String.Empty;
        public string Streeet { get; set; } = String.Empty;
        public Int16 PLZ { get; set; }
        public string City { get; set; } = String.Empty;
        public string StoreType { get; set; } = String.Empty;
        public int WeekKalendarId { get; set; }
    }
}
