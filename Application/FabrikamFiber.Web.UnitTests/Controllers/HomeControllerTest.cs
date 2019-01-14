namespace FabrikamFiber.Web.UnitTests.Controllers
{
    using System.Web.Mvc;
    using FabrikamFiber.DAL.Data;
    using FabrikamFiber.Web.Controllers;
    using Xunit;
    using NSubstitute;

    public class HomeControllerTest
    {
        [Fact]
        public void IndexReturnsNonNullView()
        {
            var serviceTicketRepo = Substitute.For<IServiceTicketRepository>();
            var messageRepo = Substitute.For<IMessageRepository>();
            var alertRepo = Substitute.For<IAlertRepository>();
            var scheduleItemRepo = Substitute.For<IScheduleItemRepository>();

            var controller = new HomeController(
                serviceTicketRepo,
                messageRepo,
                alertRepo,
                scheduleItemRepo
            );

            var result = (ViewResult)controller.Index();
        }

        #region Mocks
        class MockServiceTicketRepository : IServiceTicketRepository
        {

            public System.Linq.IQueryable<DAL.Models.ServiceTicket> All
            {
                get
                {
                    return null;
                }
            }

            public System.Linq.IQueryable<DAL.Models.ServiceTicket> AllForReport(params System.Linq.Expressions.Expression<System.Func<DAL.Models.ServiceTicket, object>>[] includeProperties)
            {
                return null;

            }

            public System.Linq.IQueryable<DAL.Models.ServiceTicket> AllIncluding(params System.Linq.Expressions.Expression<System.Func<DAL.Models.ServiceTicket, object>>[] includeProperties)
            {
                return null;

            }

            public void Delete(int id)
            {

            }

            public DAL.Models.ServiceTicket Find(int id)
            {
                return null;

            }

            public DAL.Models.ServiceTicket FindIncluding(int id, params System.Linq.Expressions.Expression<System.Func<DAL.Models.ServiceTicket, object>>[] includeProperties)
            {
                return null;
            }

            public void InsertOrUpdate(DAL.Models.ServiceTicket serviceticket)
            {

            }

            public void Save()
            {

            }
        }

        class MockMessageRepository : IMessageRepository
        {
            public System.Linq.IQueryable<DAL.Models.Message> All
            {
                get { return null; }
            }

            public System.Linq.IQueryable<DAL.Models.Message> AllIncluding(params System.Linq.Expressions.Expression<System.Func<DAL.Models.Message, object>>[] includeProperties)
            {
                return null;
            }

            public void Delete(int id)
            {

            }

            public DAL.Models.Message Find(int id)
            {
                return null;
            }

            public void InsertOrUpdate(DAL.Models.Message message)
            {

            }

            public void Save()
            {

            }
        }

        class MockAlertRepository : IAlertRepository
        {
            public System.Linq.IQueryable<DAL.Models.Alert> All
            {
                get { return null; }
            }

            public System.Linq.IQueryable<DAL.Models.Alert> AllIncluding(params System.Linq.Expressions.Expression<System.Func<DAL.Models.Alert, object>>[] includeProperties)
            {
                return null;
            }

            public void Delete(int id)
            {

            }

            public DAL.Models.Alert Find(int id)
            {
                return null;
            }

            public void InsertOrUpdate(DAL.Models.Alert alert)
            {

            }

            public void Save()
            {

            }
        }

        class MockScheduleItemRepository : IScheduleItemRepository
        {
            public System.Linq.IQueryable<DAL.Models.ScheduleItem> All
            {
                get { return null; }
            }

            public System.Linq.IQueryable<DAL.Models.ScheduleItem> AllIncluding(params System.Linq.Expressions.Expression<System.Func<DAL.Models.ScheduleItem, object>>[] includeProperties)
            {
                return null;
            }

            public void Delete(int id)
            {

            }

            public DAL.Models.ScheduleItem Find(int id)
            {
                return null;
            }

            public void InsertOrUpdate(DAL.Models.ScheduleItem scheduleitem)
            {

            }

            public void Save()
            {

            }
        }
        #endregion
    }
}
