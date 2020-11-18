using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project3
{
    [Serializable]
    public class Order : IComparable<Order>
    {
        private int orderNum;
        private string custName;
        private string phoneNum;
        private char cookieType;
        private int quantity;
        private DateTime orderDate;
        private DateTime delivDate;

        public int OrderNum 
        { 
            get => orderNum; 
            set => orderNum = value; 
        }
        public string CustName 
        { 
            get => custName;
            set
            {
                string theString = value.Trim();
                if(theString.Length > 0)
                {
                    custName = value.Trim();
                }
                else
                {
                    throw new EmptyCustomerNameException();
                }
                
            }
        }
        public string PhoneNum 
        { 
            get => phoneNum; 
            set
            {
                string theString = value.Trim();
                //MessageBox.Show(theString.Length.ToString());
                if (theString.Length >= 10)
                {
                    phoneNum = value.Trim();
                }
                else
                {
                    throw new EmptyPhoneNumException();
                }

            }
        }
        public char CookieType 
        { 
            get => cookieType; 
            set
            {
                if (value == 'C' || value == 'O' || value == 'S')
                {
                    cookieType = value;
                }
                else
                {
                    throw new InvalidCookieTypeException();
                }

            }
        }
        public int Quantity 
        { 
            get => quantity; 
            set
            {
                if(value > 0)
                {
                    quantity = value;
                }
                else
                {
                    throw new LowQuantityException();
                }
            } 
        }
        public DateTime OrderDate 
        { 
            get => orderDate; 
            private set => orderDate = value; 
        }
        public DateTime DelivDate 
        { 
            get => delivDate;
            set
            {
                if (value >= OrderDate)
                {
                    delivDate = value;
                }
                else
                {
                    throw new DeliveryDateTooEarlyException();
                }
            }
        }

        public Order(int orderNum) : this(orderNum, "default", "1234567890", 'C', 1, DateTime.Today) { }

        public Order(int iOrdNum, string iCustName, string iPhoneNum, char iCookieType, int iQuantity, DateTime iDelivDate)
        {
            OrderNum = iOrdNum;
            CustName = iCustName;
            PhoneNum = iPhoneNum;
            CookieType = iCookieType;
            Quantity = iQuantity;
            OrderDate = DateTime.Today;
            DelivDate = iDelivDate;
        }

        public int CompareTo(Order obj)
        {
            return delivDate.CompareTo(obj.DelivDate);
        }
    }
}
