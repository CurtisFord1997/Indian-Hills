using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project4
{
    [Serializable]
    public class Assignment
    {
        protected string assignmentName;
        protected double pointsEarned;
        protected double pointsPossible;

        public string AssignmentName
        {
            get => assignmentName;
            set
            {
                if(value.Trim().Length > 0)
                {
                    assignmentName = value.Trim();
                }
                else
                {
                    throw new EmptyGradeNameException();
                }
            }
        }

        public double PointsEarned
        {
            get => pointsEarned;
            set
            {
                if (value >= 0)
                {
                    pointsEarned = value;
                }
                else
                {
                    throw new LowPointsException();
                }
            }
        }

        public double PointsPossibe
        {
            get => pointsPossible;
            set
            {
                if (value >= 0)
                {
                    pointsPossible = value;
                }
                else
                {
                    throw new LowPointsException();
                }
            }
        }

        public Assignment(string assName, double ptsEarned, double ptsPossible)
        {
            AssignmentName = assName;
            PointsEarned = ptsEarned;
            PointsPossibe = ptsPossible;
        }
    }
}
