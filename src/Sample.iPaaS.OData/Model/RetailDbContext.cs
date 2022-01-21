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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<StoreCalendar>().ToView("StoreCalendar", "BankHoliday_V100").HasNoKey();
        }
    }
}
