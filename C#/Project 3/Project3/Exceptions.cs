using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project3
{
    public class EmptyCustomerNameException : Exception
    {
        public string msg = "The customer string is empty.";
    }
    public class EmptyPhoneNumException : Exception
    {
        public string msg = "The phone number is invalid.";
    }
    public class InvalidCookieTypeException : Exception
    {
        public string msg = "Cookie type has to be a C, O, or S.";
    }
    public class LowQuantityException : Exception
    {
        public string msg = "Quantiy needs to be one or greater.";
    }
    public class DeliveryDateTooEarlyException : Exception
    {
        public string msg = "Delivery date can't be earlier than order date";
    }
}
