using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Project2
{
    public class Job : IComparable<Job>
    {
        private string jobDescription;
        private double hoursToComplete;
        private double hourlyRate;

        public Job() : this("mow yard", 1, 10) { }
        public Job(string description) : this(description, 1, 10) { }
        public Job(string description, double hours, double hourRate)
        {
            JobDescription = description;
            HoursToComplete = hours;
            HourlyRate = hourRate;
        }

        public string JobDescription 
        { 
            get => jobDescription;
            set
            {
                if(value.Trim().Length > 0)
                {
                    jobDescription = value;
                }
                else
                {
                    jobDescription = "mow yard";
                }
                
            }
        }
        public double HoursToComplete 
        { 
            get => hoursToComplete;
            set
            {
                if(value > 0)
                {
                    hoursToComplete = value;
                }
                else
                {
                    hoursToComplete = 1;
                }
                
            }
        }
        public double HourlyRate 
        { 
            get => hourlyRate;
            set
            {
                if(value > 0)
                {
                    hourlyRate = value;
                }
                else
                {
                    hourlyRate = 10;
                }
                
            }
        }

        public double CalcFee()
        {
            return hourlyRate * hoursToComplete;
        }

        public int CompareTo(Job theJob)
        {
            return this.CalcFee().CompareTo(theJob.CalcFee());
        }

        public static Job operator+ (Job a, Job b)
        {
            double combHrs = a.HoursToComplete + b.HoursToComplete;
            double weightedAverageHourlyWage = (a.HourlyRate * a.HoursToComplete + b.HourlyRate * b.HoursToComplete)/ combHrs;
            return new Job(a.JobDescription + " and " + b.JobDescription, combHrs, weightedAverageHourlyWage);
        }
    }
}
