using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Project4Console
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (Program.stringQuery.Length > 0)
            {
                ByName(Program.stringQuery);
            }
            else
            {
                AllEmp();
            }
        }

        private void ByName(string name)
        {
            string jsonData;
            localhost.WebService1 theService = new localhost.WebService1();
            jsonData = theService.GetSingleCustomer(name);
            var result = JsonConvert.DeserializeObject<List<Loan>>(jsonData);
            dataGridView1.DataSource = result;
        }

        private void AllEmp()
        {
            string jsonData;
            localhost.WebService1 theService = new localhost.WebService1();
            jsonData = theService.GetLoansByCustomer();
            var result = JsonConvert.DeserializeObject<List<Loan>>(jsonData);
            dataGridView1.DataSource = result;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
