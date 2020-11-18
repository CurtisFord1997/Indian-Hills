using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project4
{
    public class DormInvalidException : Exception
    {
        public string msg = "Dorm name invalid";
    }

    public class DormEmptyExeption : Exception
    {
        public string msg = "Dorm string empty";
    }

    public class InvalidMealPlanException : Exception
    {
        public string msg = "Meal plan contains invalid data";
    }

    public class InvalidIdException : Exception
    {
        public string msg = "ID needs to be positive";
    }

    public class InvalidNameException : Exception
    {
        public string msg = "Name is empty";
    }
}
