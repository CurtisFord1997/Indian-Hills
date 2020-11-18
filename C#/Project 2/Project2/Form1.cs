using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Project2
{
    public partial class Form1 : Form
    {
        private List<Job> jobList = new List<Job>();

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string desc = txtDesc.Text.Trim();
            string strHrs = txtHours.Text.Trim();
            string strRate = txtRate.Text.Trim();
            try
            {
                if (desc.Length == 0) 
                {
                    txtDesc.ForeColor = Color.Red;
                    throw new System.ArgumentException("String cannot be null");
                }
                                
                double hrs = Double.Parse(strHrs);
                double rate = Double.Parse(strRate);
                Job newJob = new Job(desc,hrs,rate);
                jobList.Add(newJob);
            }
            catch(Exception)
            {
                double garage;
                if (Double.TryParse(strHrs, out garage))
                { }
                else
                {
                    txtHours.ForeColor = Color.Red;
                }

                if (Double.TryParse(strRate, out garage))
                { }
                else
                {
                    txtRate.ForeColor = Color.Red;
                }
            }
            
        }

        private void tabPage2_Click(object sender, EventArgs e)
        {
            
        }

        private void tabCombJob_Click(object sender, EventArgs e)
        {

        }

        private string formatJob(Job j)
        {
            string descrip = j.JobDescription;
            string hrs = String.Format("{0:0.00}", j.HoursToComplete);
            string rate = String.Format("{0:0.00}", j.HourlyRate);
            
            string theString = String.Format("{0,-20}", descrip);
            theString += String.Format("{0,8}", hrs);
            theString += String.Format("{0,8}", rate);

            return theString;
        }

        private void txtDispAll_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnViewJobs_Click(object sender, EventArgs e)
        {
            List<string> outputList = new List<string>();
            if (jobList.Count() == 0)
            {
                outputList.Add("No Data Entered");
            }
            else
            {
                string outputString = String.Format("{0,-20}", "Description");
                outputString += String.Format("{0,-8}", "Hours");
                outputString += String.Format("{0,-8}", "Rate");
                outputList.Add(outputString);
                List<Job> tempList = jobList;
                tempList.Sort();
                foreach (Job j in tempList)
                {
                    outputList.Add(formatJob(j));
                }
            }
            lstViewJobs.DataSource = outputList;
        }

        private void btnJobRefresh_Click(object sender, EventArgs e)
        {
            List<string> outputList = new List<string>();
            List<string> outputList2 = new List<string>();
            if (jobList.Count() == 0)
            {
                comCombineJob1.IsAccessible = false;
            }
            else
            {
                foreach (Job j in jobList)
                {
                    outputList.Add(formatJob(j));
                    outputList2.Add(formatJob(j));
                }
            }
            comCombineJob1.DataSource = outputList;
            comCombineJob2.DataSource = outputList2;
        }

        private void comCombineJob2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnCombine_Click(object sender, EventArgs e)
        {
            Job returnJob = jobList[comCombineJob1.SelectedIndex] + jobList[comCombineJob2.SelectedIndex];
            txtCombined.Text = formatJob(returnJob);
        }
    }
    static class Program
    {
        static void Main()
        {
            Form1 theForm = new Form1();
            Application.Run(theForm);
        }
    }
}
