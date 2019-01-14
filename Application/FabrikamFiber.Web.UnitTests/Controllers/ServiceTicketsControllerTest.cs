namespace FabrikamFiber.Web.UnitTests.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Web.Mvc;
    using FabrikamFiber.DAL.Data;
    using FabrikamFiber.DAL.Models;
    using FabrikamFiber.Web.Controllers;
    using FabrikamFiber.Web.ViewModels;
    using NSubstitute;
    using Xunit;

    public class ServiceTicketsControllerTest: IDisposable
    {
        ICustomerRepository mockCustomerRepo;
        IEmployeeRepository mockEmployeeRepo;
        IServiceTicketRepository mockServiceTicketRepo;
        IServiceLogEntryRepository mockLogEntryRepo;
        IScheduleItemRepository mockScheduleItemRepo;
        ServiceTicketsController controller;

        public ServiceTicketsControllerTest()
        {
            mockCustomerRepo = Substitute.For<ICustomerRepository>();
            mockEmployeeRepo = Substitute.For<IEmployeeRepository>();
            mockServiceTicketRepo = Substitute.For<IServiceTicketRepository>();
            mockLogEntryRepo = Substitute.For<IServiceLogEntryRepository>();
            mockScheduleItemRepo = Substitute.For<IScheduleItemRepository>();

            controller = new ServiceTicketsController(
                mockCustomerRepo,
                mockEmployeeRepo,
                mockServiceTicketRepo,
                mockLogEntryRepo,
                mockScheduleItemRepo
            );
        }

        [Fact]
        public void ScheduleActionReturnsValidViewModel()
        {
            // Arrange
            mockServiceTicketRepo.FindIncluding(Arg.Any<int>(), Arg.Any<Expression<Func<ServiceTicket, object>>[]>()).Returns( new ServiceTicket { ID = 1 });
            mockEmployeeRepo.Find(Arg.Any<int>()).Returns(new Employee { ID = 1 });
            var scheduleItems = new List<ScheduleItem>();
            scheduleItems.Add(new ScheduleItem { ID = 1, });
            mockScheduleItemRepo.AllIncluding().Returns(scheduleItems.AsQueryable<ScheduleItem>());

            // Act
            var result = (ViewResult)controller.Schedule(1, 1, 0);

            // Assert
            var model = result.ViewData.Model as ScheduleViewModel;
            Assert.NotNull(model.Employee);
            Assert.NotNull(model.ScheduleItems);
            Assert.NotNull(model.ServiceTicket);
            controller.ViewBag.StartTime = 0;
        }

        [Xunit.Fact]
        public void ScheduleActionCorrectlyUpdatesRepositories()
        {
            // Arrange
            var scheduleItems = new List<ScheduleItem>();
            scheduleItems.Add(new ScheduleItem { ServiceTicketID = 1 });
            //mockScheduleItemRepo.SetReturnValue("get_All", scheduleItems.AsQueryable<ScheduleItem>());
            
            ServiceTicket ticket = new ServiceTicket { ID = 0 };
            mockServiceTicketRepo.Find(Arg.Any<int>()).Returns(ticket);
            
            // Act
            controller.AssignSchedule(1, 101, 0);

            // Assert
            Assert.Equal(101, ticket.AssignedToID);
            mockScheduleItemRepo.Received().Save();
            mockServiceTicketRepo.Received().Save();
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                controller.Dispose();
            }
        }
    }
}
