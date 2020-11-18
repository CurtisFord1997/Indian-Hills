using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using static System.Console;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Windows.Forms;

namespace Project4Console
{
    class Program
    {
        public static string stringQuery;
        static void Main(string[] args) 
        {

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            while (Menu().Trim() == "1")
            {
                WriteLine("Enter in employee name to search for data for a specific employee, or hit enter to get all data");
                stringQuery = ReadLine().Trim();
                Application.Run(new Form1());
            }
        }

        static string Menu()
        {
            WriteLine("Press 1 to view data or enter anything anything else to exit");
            return ReadLine().Trim();
        }

        

        static void DisplayEmployees()
        {

        }
    }
}
