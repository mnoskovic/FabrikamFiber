namespace FabrikamFiber.Web.UnitTests.Controllers
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Web.Mvc;
    using FabrikamFiber.DAL.Data;
    using FabrikamFiber.DAL.Models;
    using FabrikamFiber.Web.Controllers;
    using Xunit;

    public class CustomersControllerTest
    {
        MockCustomerRepository mockCustomerRepo;
        CustomersController controller;

        public CustomersControllerTest()
        {
            mockCustomerRepo = new MockCustomerRepository();
            controller = new CustomersController(mockCustomerRepo);
        }
        
        [Fact]
        public void CreateInsertsCustomerAndSaves()
        {
            controller.Create(new Customer());

            Assert.True(mockCustomerRepo.IsInsertOrUpdateCalled);
            Assert.True(mockCustomerRepo.IsSaveCalled);
        }

        [Fact]

        public void CreateNullCustomer()
        {
            Assert.Throws<ArgumentNullException>(()=>controller.Create(null));
        }

        [Fact]
        public void EditUpdatesCustomerAndSaves()
        {
            controller.Edit(new Customer());

            Assert.True(mockCustomerRepo.IsInsertOrUpdateCalled);
            Assert.True(mockCustomerRepo.IsSaveCalled);
        }

        [Fact]
        public void DeleteConfirmedDeletesCustomerAndSaves()
        {
            controller.DeleteConfirmed(1);

            Assert.True(mockCustomerRepo.IsDeleteCalled);
            Assert.True(mockCustomerRepo.IsSaveCalled);
        }

        [Fact]
        public void DeleteFindAndReturnsCustomer()
        {
            var result = controller.Delete(1);

            var model = ((ViewResult)result).Model;

            Assert.True(mockCustomerRepo.IsFindCalled);
            Assert.True(typeof(Customer).IsAssignableFrom(model.GetType()));
        }

        #region Mocks
        class MockCustomerRepository : ICustomerRepository
        {
            public bool IsInsertOrUpdateCalled { get; set; }

            public bool IsSaveCalled { get; set; }

            public bool IsDeleteCalled { get; set; }

            public bool IsFindCalled { get; set; }

            public IQueryable<Customer> All
            {
                get { throw new NotImplementedException(); }
            }

            public IQueryable<Customer> AllIncluding(params Expression<Func<Customer, object>>[] includeProperties)
            {
                throw new NotImplementedException();
            }

            public Customer Find(int id)
            {
                this.IsFindCalled = true;
                return new Customer();
            }

            public void InsertOrUpdate(Customer customer)
            {
                this.IsInsertOrUpdateCalled = true;
            }

            public void Delete(int id)
            {
                this.IsDeleteCalled = true;
            }

            public void Save()
            {
                this.IsSaveCalled = true;
            }
        }
        #endregion
    }
}
