using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project4
{
    [Serializable]
    public class Student : IComparable<Student>
    {
        protected int studentId;
        protected string name;
        protected List<Assignment> assignments;

        public int StudentId
        {
            get => studentId;
            set 
            {
                if (value < 0)
                {
                    throw new InvalidIdException();
                }
                studentId = value;
            }
        }

        public string Name
        {
            get => name;
            set 
            { 
                if (value.Trim().Length == 0)
                {
                    throw new InvalidNameException(); 
                }
                name = value.Trim(); 
            }
        }

        public List<Assignment> Assignments
        {
            get => assignments;
            set => assignments = value;
        }

        public Student(int stuID, string stuName, List<Assignment> stuAssignments)
        {
            Name = stuName;
            StudentId = stuID;
            Assignments = stuAssignments;
        }

        public Student(int stuID, string stuName) : this(stuID, stuName, new List<Assignment>()) { }

        protected Student() { }

        public int CompareTo(Student obj)
        {
            return StudentId.CompareTo(obj.StudentId);
        }
    }
}
