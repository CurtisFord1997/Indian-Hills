using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project3
{
    public partial class DisplayForm : Form
    {
        public DisplayForm()
        {
            InitializeComponent();
        }

        private void DisplayForm_Load(object sender, EventArgs e)
        {
            List<Order> sortedBooks = new List<Order>(AddOrder.orderList);
            sortedBooks.Sort();
            //sortedBooks.Reverse();

            List<string> orderStringList = new List<string>();
            orderStringList.Add(String.Format("{0,-30}{1,-15}{2,-11}{6,2}{3,-8}{6,2}{4,-30}{5,-30}", "Customer Name", "Phone Number","Cookie Type","Quantity","Order Date", "DelivDate", " "));
            foreach (Order ord in sortedBooks)
            {
                orderStringList.Add(MakeOrderString(ord));
            }

            lstDetails.DataSource = orderStringList;
        }

        public string MakeOrderString(Order theOrder)
        {
            string theString = String.Format("{0,-30}{1,-15}{2,-11}{6,2}{3,-8}{6,2}{4,-30}{5,-30}", theOrder.CustName.Trim(), theOrder.PhoneNum, theOrder.CookieType, theOrder.Quantity, theOrder.OrderDate.ToString(), theOrder.DelivDate.ToString(), " ");

            return theString;
        }

        private void btnReturn_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
