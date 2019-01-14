namespace FabrikamFiber.DAL.Data
{
    using Models;
    using System.Data.Entity;

    public class FabrikamFiberWebContext : DbContext
    {
         public FabrikamFiberWebContext()
            : base("DefaultConnection")
        {
        }

        public FabrikamFiberWebContext(string connectionString)
            : base(connectionString)
        {
            
        }

        public DbSet<Models.Customer> Customers { get; set; }

        public DbSet<Models.Employee> Employees { get; set; }

        public DbSet<Models.ServiceTicket> ServiceTickets { get; set; }

        public DbSet<Models.ServiceLogEntry> ServiceLogEntries { get; set; }

        public DbSet<Models.Message> Messages { get; set; }

        public DbSet<Models.Alert> Alerts { get; set; }

        public DbSet<Models.ScheduleItem> ScheduleItems { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ServiceTicket>().Ignore(t => t.Status);
            base.OnModelCreating(modelBuilder);
        }
    }
}