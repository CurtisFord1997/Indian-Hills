using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace Project3.Tests
{
    [TestClass()]
    public class OrderTests
    {
        public Order theOrder = new Order(0, "Customer", "12345689",'C',5,DateTime.Today);
        
        [TestMethod()]
        public void EmptyName()
        {
            try
            {
                theOrder.CustName = "";
                Assert.Fail();
            }
            catch { }
            
        }

        [TestMethod()]
        public void EmptyPhone()
        {
            try
            {
                theOrder.PhoneNum = "";
                Assert.Fail();
            }
            catch { }
        }

        [TestMethod()]
        public void BadCookie()
        {
            try
            {
                char theCookie = 'a';
                theOrder.CookieType = theCookie;
                Assert.Fail();
            }
            catch { }
            
        }

        [TestMethod()]
        public void TooFewCookies()
        {
            try
            {
                theOrder.Quantity = -1;
                Assert.Fail();
            }
            catch { }
        }

        [TestMethod()]
        public void BadOrder()
        {
            try
            {
                DateTime theDate = new DateTime();
                theDate.AddDays(-1);
                theOrder.DelivDate = theDate;
                Assert.Fail();
            }
            catch { }
        }
    }
}