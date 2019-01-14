namespace FabrikamFiber.Web.UnitTests.Helpers
{
    using FabrikamFiber.Web.Helpers;
    using System;
    using Xunit;

    public class GuardTest
    {
        [Fact]
        public void ItShouldThrowExceptionIfArgumentIsNull()
        {
            Assert.Throws<ArgumentNullException>(() => Guard.ThrowIfNull(null, "value"));
        }

        [Fact]
        public void ItShouldNotThrowExceptionIfArgumentIsNotNull()
        {
            Guard.ThrowIfNull("this is not null", "value");
        }

        [Fact]
        public void ItShouldThrowExceptionIfArgumentIsNullOrEmpty()
        {
            Assert.Throws<ArgumentNullException>(() => Guard.ThrowIfNullOrEmpty(string.Empty, "value"));
        }

        [Fact]
        public void ItShouldNotThrowExceptionIfArgumentIsNotNullOrEmpty()
        {
            Guard.ThrowIfNullOrEmpty("not null or empty", "value");
        }

        [Fact]
        public void ItShouldThrowExceptionIfArgumentIsLesserThanZero()
        {
            Assert.Throws<ArgumentOutOfRangeException>(() => Guard.ThrowIfLesserThanZero(-1, "value"));
        }

        [Fact]
        public void ItShouldNotThrowExceptionIfArgumentIsNotLesserThanZero()
        {
            Guard.ThrowIfLesserThanZero(1, "value");
        }
    }
}
