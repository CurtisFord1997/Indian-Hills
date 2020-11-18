using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Runtime.CompilerServices;

namespace Project3
{
    public partial class AddOrder : Form
    {
        public static List<Order> orderList = new List<Order>();
        protected string filename = "orders.txt";

        public AddOrder()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void AddOrder_Load(object sender, EventArgs e)
        {
            //Load from file
            try
            {
                if (File.Exists(filename))
                {
                    FileStream inFile = new FileStream(filename, FileMode.Open, FileAccess.Read);
                    BinaryFormatter bFormatter = new BinaryFormatter();

                    while (inFile.Position < inFile.Length)
                    {
                        object obj = bFormatter.Deserialize(inFile);
                        if (obj.GetType() == typeof(Order))
                        {
                            orderList.Add((Order)obj);
                        }
                        else
                        {
                            MessageBox.Show("File had unkonwn objet, skipped");
                        }
                    }
                    inFile.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error opening file, program terminating" + ex.Message);
                this.Close();
            }

            cmbCookies.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //for debugging
            //Order origOrder = new Order(0);
            //orderList.Add(origOrder);


            Order newOrder;
            try
            {
                newOrder = new Order(orderList.Count());

                newOrder.CustName = txtCustName.Text.Trim();
                newOrder.PhoneNum = (txtPhoneNum.Text.Trim());

                char[] cookieTypeCodes = new char[] { 'C', 'O', 'S' };
                newOrder.CookieType = cookieTypeCodes[cmbCookies.SelectedIndex];
                newOrder.Quantity = Convert.ToInt32(txtQty.Text);
                newOrder.DelivDate = dateDeliv.Value;

                //newOrder.CookieType = 
                if (MessageBox.Show("Do you wish to add this order?",
                "Add Order", MessageBoxButtons.YesNo, MessageBoxIcon.Hand,
                MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                    orderList.Add(newOrder);
            }
            catch (EmptyCustomerNameException ex)
            {
                MessageBox.Show("Error adding order" + ex.msg);
            }
            catch (EmptyPhoneNumException ex)
            {
                MessageBox.Show("Error adding order" + ex.msg);
            }
            catch (InvalidCookieTypeException ex)
            {
                MessageBox.Show("Error adding order" + ex.msg);
            }
            catch (LowQuantityException ex)
            {
                MessageBox.Show("Error adding order" + ex.msg);
            }
            catch (DeliveryDateTooEarlyException ex)
            {
                MessageBox.Show("Error adding order" + ex.msg);
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do you wish write these books to the file",
                "Write To File", MessageBoxButtons.YesNo, MessageBoxIcon.Hand,
                MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                try
                {
                    FileStream outFile = new FileStream(filename,
                         FileMode.Create, FileAccess.Write);
                    BinaryFormatter bf = new BinaryFormatter();

                    foreach (var item in orderList)
                    {
                        bf.Serialize(outFile, item);
                    }
                    outFile.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error writing list to file " + ex.Message);
                }
            }
            else
            {
                MessageBox.Show("New items not written");
            }
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DisplayForm df = new DisplayForm();
            df.ShowDialog();
        }

        private void txtCustName_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtCustName_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar < '0' || e.KeyChar > '9') &&
                (e.KeyChar != (char)Keys.Back))
            {
                e.Handled = true;
            }
        }
        private void txtPhoneNum_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar < '0' || e.KeyChar > '9') &&
                (e.KeyChar != (char)Keys.Back))
            {
                e.Handled = true;
            }

            if (txtPhoneNum.Text.Length > 9 &&
                (e.KeyChar != (char)Keys.Back))
            {
                e.Handled = true;
            }
        }

    }
}
