using Project4;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace TAL_Distributors_Web_Service
{
    /// <summary>
    /// Summary description for TALWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        [WebMethod]
        public string GetLoansByCustomer()
        {
            using (CheapLoansEntities context = new CheapLoansEntities())
            {

                //Get the List of Customers from the database
                var custList = context.StoredSelect().ToList();

                //custList.Clear(); //this was used to test the table empty return

                if (custList.Count > 0)
                {
                    return JsonConvert.SerializeObject(custList, Formatting.Indented,
                                   new JsonSerializerSettings()
                                   {
                                       ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                   });
                }
                else
                {
                    return "Table empty";
                }


            }
        }

        [WebMethod]
        public string GetSingleCustomer(string name)
        {
            using (CheapLoansEntities context = new CheapLoansEntities())
            {

                //Get the List of Customers from the database
                var custList = context.SelectCustomer(name).ToList();

                if (custList.Count > 0)
                {
                    return JsonConvert.SerializeObject(custList, Formatting.Indented,
                                   new JsonSerializerSettings()
                                   {
                                       ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                   });
                }
                else
                {
                    return "No such customer";
                }
            
            }
            return "hello";
        }
    }
}
