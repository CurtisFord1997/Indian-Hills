using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project4
{
    [Serializable]
    public class DormStudent : Student
    {
        protected string dorm;
        protected char mealPlanType;

        public string Dorm 
        { 
            get => dorm;
            set
            {
                if(value.Trim().Length > 0)
                {
                    dorm = value.Trim();
                }
                else
                {
                    throw new DormEmptyExeption();
                }
            }
             
        }

        public char MealPlanType
        {
            get => mealPlanType;
            set
            {
                char[] validMeals = { 'B', 'M', 'H' };
                if (validMeals.Contains(value))
                {
                    mealPlanType = value;
                }
                else
                {
                    throw new InvalidMealPlanException();
                }
            }
        }

        public DormStudent(int stuID, string stuName, string stuDorm, char stuMealPlanType, List<Assignment> stuAssignments)
        {
            Name = stuName;
            StudentId = stuID;
            Dorm = stuDorm;
            MealPlanType = stuMealPlanType;
            Assignments = stuAssignments;
        }

        public DormStudent(int stuID, string stuName, string stuDorm, char stuMealPlanType) : this(stuID, stuName, stuDorm, stuMealPlanType, new List<Assignment>()) { }
    }
}
