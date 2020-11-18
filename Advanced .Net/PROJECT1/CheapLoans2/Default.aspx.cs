using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CheapLoans2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCalcMonPmt_Click(object sender, EventArgs e)
        {
            try
            {
                Double amt = Double.Parse(txtAmt.Text.Trim());
                Double rate = Double.Parse(txtIntRate.Text.Trim());
                Int32 NumPmts = Int32.Parse(txtNumPmts.Text.Trim());

                txtMonthly.Text = (Financial.Pmt(rate,NumPmts,amt,0)).ToString();

                lblErrorMsg.Visible = false;
                btnSubmit.Enabled = true;
            }
            catch
            {
                lblErrorMsg.Text = "Numbers didn't pass validation, please try again.";
                lblErrorMsg.Visible = true;

            }
            
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheapLoans.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["CheapLoansConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand("InsertProcedure", conn);

                SqlCommand cmd2 = new SqlCommand("Insert into Loan (CustName,LoanAmount,AnnualIntRate,NumPayments) values(@CustName, @LoanAmount, @AnnualIntRate, @NumPayments);",conn);

                
                //cmd.CommandType = CommandType.Select

                cmd2.Parameters.Add("@CustName", SqlDbType.VarChar).Value = txtCustName.Text.Trim();
                cmd2.Parameters.Add("@LoanAmount", SqlDbType.Decimal).Value = Double.Parse(txtAmt.Text.Trim());
                cmd2.Parameters.Add("@AnnualIntRate", SqlDbType.Decimal).Value = Double.Parse(txtIntRate.Text.Trim());
                cmd2.Parameters.Add("@NumPayments", SqlDbType.Int).Value = Int32.Parse(txtNumPmts.Text.Trim());

                txtCustName.Text = "";
                txtAmt.Text = "";
                txtIntRate.Text = "";
                txtNumPmts.Text = "";
                txtMonthly.Text = "";

                conn.Open();
                cmd2.ExecuteNonQuery();
                //cmd.ExecuteNonQuery();
                lblErrorMsg.Visible = false;
            }
            catch(Exception)
            {
                lblErrorMsg.Text = "Data entered invalid, please try again.";
                lblErrorMsg.Visible = true;
            }
        }

        private bool plzValidateString(string theString)
        {
            if (theString.Trim().Length > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}