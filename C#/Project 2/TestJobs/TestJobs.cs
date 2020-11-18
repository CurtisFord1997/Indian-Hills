using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace Project2
{
    [TestClass]
    public class TestJobs
    {
        public static Job theDefaultJob = new Job();
        public static Job OneOverRiddenJob = new Job("Refactoring");
        public static Job FullOverRiddenJob = new Job("Sleeping", 30, 20);
        public Job addedJob = theDefaultJob + OneOverRiddenJob;
        public Job shouldResetToDefaults = new Job(" ", 0,0);


        public List<Job> jobList = new List<Job>();

        [TestMethod]
        public void TestCreatingList()
        {
            jobList.Add(new Job());
            jobList.Add(new Job("Refactoring"));
            jobList.Add(new Job("Sleeping", 30, 20));
            jobList.Add(new Job("June",12,10));
            //adds two jobs together to create an added list item
            jobList.Add(jobList[0] + jobList[1]);
        }

        //Test Default Constructor
        [TestMethod]
        public void TestDefaultDesc()
        {
            Assert.AreEqual("mow yard", theDefaultJob.JobDescription);
        }

        [TestMethod]
        public void TestDefaultHours()
        {
            Assert.AreEqual(1, theDefaultJob.HoursToComplete);
        }

        [TestMethod]
        public void TestDefaultRate()
        {
            Assert.AreEqual(10, theDefaultJob.HourlyRate);
        }

        //Single overriden constructor
        [TestMethod]
        public void TestSingleDesc()
        {
            Assert.AreEqual("Refactoring", OneOverRiddenJob.JobDescription);
        }

        [TestMethod]
        public void TestSingleHours()
        {
            Assert.AreEqual(1, OneOverRiddenJob.HoursToComplete);
        }

        [TestMethod]
        public void TestSingleRate()
        {
            Assert.AreEqual(10, OneOverRiddenJob.HourlyRate);
        }
        
        //Fully OveriddenConstrutor
        [TestMethod]
        public void TestFullDesc()
        {
            Assert.AreEqual("Sleeping", FullOverRiddenJob.JobDescription);
        }

        [TestMethod]
        public void TestFullHours()
        {
            Assert.AreEqual(30, FullOverRiddenJob.HoursToComplete);
        }

        [TestMethod]
        public void TestFullRate()
        {
            Assert.AreEqual(20, FullOverRiddenJob.HourlyRate);
        }

        //Test Overriden Constructor With Illegal Values (tests setters)
        [TestMethod]
        public void TestSetterDesc()
        {
            Assert.AreEqual("mow yard", shouldResetToDefaults.JobDescription);
        }

        [TestMethod]
        public void TestSetterHours()
        {
            Assert.AreEqual(1, shouldResetToDefaults.HoursToComplete);
        }

        [TestMethod]
        public void TestSetterRate()
        {
            Assert.AreEqual(10, shouldResetToDefaults.HourlyRate);
        }

        //
        [TestMethod]
        public void TestAddingJobsDesc()
        {
            Assert.AreEqual(addedJob.JobDescription, "mow yard and Refactoring");
        }

        [TestMethod]
        public void TestAddingJobsHours()
        {
            Assert.AreEqual(addedJob.HoursToComplete, 2);
        }

        [TestMethod]
        public void TestAddingJobsRate()
        {
            Assert.AreEqual(addedJob.HourlyRate, 10);
        }

        [TestMethod]
        public void TestSortingList()
        {
            jobList.Add(new Job());
            jobList.Add(new Job("Refactoring", 3,10));
            jobList.Add(new Job("Sleeping", 30, 20));
            jobList.Add(new Job("June", 12, 10));
            //adds two jobs together to create an added list item
            jobList.Add(jobList[0] + jobList[1]);

            jobList.Sort();

            Assert.AreEqual("mow yard", jobList[0].JobDescription);
            Assert.AreEqual("Refactoring", jobList[1].JobDescription);
            Assert.AreEqual("mow yard and Refactoring", jobList[2].JobDescription);
            Assert.AreEqual("June", jobList[3].JobDescription);
            Assert.AreEqual("Sleeping", jobList[4].JobDescription);
        }
    }
}
