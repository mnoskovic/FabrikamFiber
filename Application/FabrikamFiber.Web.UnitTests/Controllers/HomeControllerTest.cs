namespace FabrikamFiber.Web.UnitTests.Controllers
{
    using FabrikamFiber.DAL.Data;
    using FabrikamFiber.Web.Controllers;
    using NSubstitute;
    using System.Web.Mvc;
    using Xunit;

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
            Assert.NotNull(result);
        }
    }
}
