using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project4Console
{
    class Loan
    {
        public string LoanNum { get; set; }
        public string CustName { get; set; }
        public double LoanAmount { get; set; }
        public double AnnualIntRate { get; set; }
        public int NumPayments { get; set; }
    }
}
