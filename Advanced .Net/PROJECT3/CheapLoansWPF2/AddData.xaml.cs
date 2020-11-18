using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CheapLoansWPF2
{
    /// <summary>
    /// Interaction logic for AddData.xaml
    /// </summary>
    public partial class AddData : Page
    {
        public AddData()
        {
            InitializeComponent();
        }

        private void btnCalcPMT_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Double amt = Double.Parse(txtAmt.Text.Trim());
                Double rate = Double.Parse(txtIntRate.Text.Trim());  
                Int32 NumPmts = Int32.Parse(txtNumPmts.Text.Trim());

                txtMonthly.Text = (PMT(rate, NumPmts, amt)).ToString();
                lblErrorMsg.Visibility = Visibility.Hidden;
                btnSubmit.IsEnabled = true;
            }
            catch
            {
                lblErrorMsg.Content = "Numbers didn't pass validation, please try again.";
                lblErrorMsg.Visibility = Visibility.Visible;

            }
        }

        private void btnSubmit_Click(object sender, RoutedEventArgs e)
        {
            CheapLoansEntities dataEntities = new CheapLoansEntities();

            Double amt = 0;
            Double rate = 0;
            Int32 NumPmts = 0; 
            Decimal amt2 = 0;
            Decimal rate2 = 0;
            try
            {
                try
                {
                    amt = Double.Parse(txtAmt.Text.Trim());
                    rate = Double.Parse(txtIntRate.Text.Trim());
                    NumPmts = Int32.Parse(txtNumPmts.Text.Trim());

                    txtMonthly.Text = (PMT(rate, NumPmts, amt)).ToString();
                    lblErrorMsg.Visibility = Visibility.Hidden;
                    btnSubmit.IsEnabled = true;
                    
                }
                catch
                {
                    lblErrorMsg.Content = "Numbers didn't pass validation, please try again.";
                    lblErrorMsg.Visibility = Visibility.Visible;

                }
                amt2 = Convert.ToDecimal(amt);
                rate2 = Convert.ToDecimal(rate / 100);
                dataEntities.InsertProcedure(txtCustName.Text, amt2, rate2, NumPmts);
            }
            catch (Exception)
            {
                lblErrorMsg.Content = "Data entered invalid, please try again.";
                lblErrorMsg.Visibility = Visibility.Visible;
            }
            
        }

        private void btnViewData_Click(object sender, RoutedEventArgs e)
        {
            ViewData viewDataPage = new ViewData();
            this.NavigationService.Navigate(viewDataPage);
        }


        //importing visual basic wasn't working
        public static double PMT(double yearlyInterestRate, int totalNumberOfMonths, double loanAmount)
        {
            var rate = (double)yearlyInterestRate / 100 / 12;
            var denominator = Math.Pow((1 + rate), totalNumberOfMonths) - 1;
            return (rate + (rate / denominator)) * loanAmount;
        }
    }
}
