using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project4
{
    public class EmptyGradeNameException : Exception
    {
        public string msg = "Grade must have a name";
    }

    public class LowPointsException : Exception
    {
        public string msg = "Points have a minimum of zero";
    }
}
