using Microsoft.EntityFrameworkCore;

namespace Sample.iPaaS.OData.Model
{
    public class RetailDbContext : DbContext
    {
        public RetailDbContext(DbContextOptions<RetailDbContext> options)
           : base(options)
        {
        }

        public DbSet<StoreCalendar> StoreCalendarItems { get; set; } = null!;
        public DbSet<Store> Stores { get; set; } = null!;
        public DbSet<Product> Products { get; set; } = null!;
        public DbSet<DiscountedProduct> DiscountedProducts { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<StoreCalendar>().ToView("StoreCalendar", "BankHoliday_V100").HasNoKey();
            modelBuilder.Entity<Store>().ToView("Store", "BankHoliday_V100").HasNoKey();
            modelBuilder.Entity<Product>().ToView("Product", "StockListMDM_V100").HasNoKey();
            modelBuilder.Entity<DiscountedProduct>().ToView("DiscountedProduct", "StockListSAP_V100").HasNoKey();
        }
    }
}
