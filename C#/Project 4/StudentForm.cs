using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Windows.Forms;

namespace Project4
{
    public partial class StudentForm : Form
    {
        protected static List<Student> studentList = new List<Student>();
        //protected static List<Assignment> localAssignments = new List<Assignment>();
        protected string filename = "students.txt";
        protected static string status;
        public StudentForm()
        {
            InitializeComponent();
        }

        //load event gets student data and sets up the form for editing
        private void StudentForm_Load(object sender, EventArgs e)
        {
            LoadData();
            this.ActiveControl = txtInitStuName;
            ClearSearchPage();
            ClearDetailsPage();
        }

        //clears the search page and adds students to the right list
        private void ClearSearchPage()
        {
            txtInitStuName.Text = "";
            txtInitStuID.Text = "";
            AddDataToStudents(-1, "");
        }

        private void ClearDetailsPage()
        {
            tabGrp.SelectedTab = tabPage1;
            grpStuDetails.Enabled = false;
            grpStuGrades.Enabled = false;
            btnAdd.Enabled = false;
            btnDelete.Enabled = false;
            btnEdit.Enabled = false;
            txtStuID.Text = "";
            txtStuName.Text = "";
            chkCommuter.Checked = true;
            cmbDorm.SelectedIndex = 0;
            cmbMeal.SelectedIndex = 0;
            gridGrades.Rows.Clear();
        }

        private void LoadData()
        {
            try
            {
                if (File.Exists(filename))
                {
                    FileStream inFile = new FileStream(filename, FileMode.Open, FileAccess.Read);
                    BinaryFormatter bFormatter = new BinaryFormatter();

                    while (inFile.Position < inFile.Length)
                    {
                        object obj = bFormatter.Deserialize(inFile);
                        if (obj.GetType() == typeof(Student))
                        {
                            studentList.Add((Student)obj);
                        }
                        else if (obj.GetType() == typeof(DormStudent))
                        {
                            studentList.Add((DormStudent)obj);
                        }
                        else
                        {
                            MessageBox.Show("File had unkonwn objet, skipped");
                        }
                    }
                    inFile.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error opening file, program terminating" + ex.Message);
                this.Close();
            }
        }

        private bool AddDataToStudents(int startingID, string startingName)
        {
            int i = 0;
            gridStudents.Rows.Clear();

            bool higherThanNum = false;
            bool idFound = false;

            if(startingID > -1)
            {
                foreach (var item in studentList)
                {
                    if (higherThanNum)
                    {
                        if (item.StudentId == startingID)
                        {
                            idFound = true;
                        }
                        PopulateStudentRow(item, i);
                        i++;
                    } 
                    else if (item.StudentId >= startingID)
                    {
                        higherThanNum = true;
                        if (item.StudentId == startingID)
                        {
                            idFound = true;
                        }
                        PopulateStudentRow(item, i);
                        i++;
                    }
                }
            }
            else
            {
                foreach (var item in studentList)
                {
                    if(item.Name.Contains(startingName))
                    {
                        PopulateStudentRow(item, i);
                        i++;
                    }
                }
                
                
            }
            return idFound;
        }

        private void PopulateStudentRow(Student item, int i)
        {
            gridStudents.Rows.Add();
            gridStudents.Rows[i].Cells[0].Value = item.StudentId;
            gridStudents.Rows[i].Cells[1].Value = item.Name;
            if (item.GetType() == typeof(DormStudent))
            {
                gridStudents.Rows[i].Cells[2].Value = true;
            }
            else
            {
                gridStudents.Rows[i].Cells[2].Value = false;
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void chkCommuter_CheckedChanged(object sender, EventArgs e)
        {
            if (chkCommuter.Checked)
            {
                chkDorm.Checked = false;
                grpDorm.Enabled = false;
            }
        }

        private void chkDorm_CheckedChanged(object sender, EventArgs e)
        {
            if (chkDorm.Checked)
            {
                chkCommuter.Checked = false;
                grpDorm.Enabled = true;
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            status = "edit";
            OpenEditing();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            status = "add";
            OpenEditing();
        }

        private void OpenEditing()
        {
            grpStuDetails.Enabled = true;
            grpStuGrades.Enabled = true;
            txtStuID.Enabled = false;
            tabGrp.SelectedTab = tabEditStudent;
            FillDetailsPage();
            ClearSearchPage();
        }

        private void FillDetailsPage()
        {
            txtStuID.Text = txtInitStuID.Text;
            txtStuName.Text = txtInitStuName.Text;
            int stuIndex = FindStudentIndex();

            if (stuIndex != -1)
            {
                if (studentList[stuIndex] is DormStudent)
                {
                    chkDorm.Checked = true;
                    DormStudent theStudent = (DormStudent)studentList[stuIndex];

                    cmbDorm.SelectedItem = theStudent.Dorm;

                    switch (theStudent.MealPlanType)
                    {
                        case 'H':
                            cmbDorm.SelectedItem = "High";
                            break;
                        case 'M':
                            cmbDorm.SelectedItem = "Medium";
                            break;
                        default:
                            cmbDorm.SelectedItem = "Basic";
                            break;
                    }

                }

                int i = 0;
                foreach (Assignment assign in studentList[stuIndex].Assignments)
                {
                    gridGrades.Rows.Add();
                    gridGrades.Rows[i].Cells[0].Value = assign.AssignmentName;
                    gridGrades.Rows[i].Cells[1].Value = assign.PointsEarned.ToString();
                    gridGrades.Rows[i].Cells[2].Value = assign.PointsPossibe.ToString();
                    i++;
                }
            }
        }

        private void NewStudent()
        {
            btnDelete.Enabled = false;
            btnEdit.Enabled = false;
            btnAdd.Enabled = true;
        }

        private void StudentFound()
        {
            btnDelete.Enabled = true;
            btnEdit.Enabled = true;
            btnAdd.Enabled = false;
        }

        private void btnSubStu_Click(object sender, EventArgs e)
        {
            string msg = "";

            if (status == "add")
            {
                msg = "Do you wish to add this student?";
            }
            else
            {
                msg = "Do you wish to edit Student " + txtStuID.Text + "?";
            }
            

            if (MessageBox.Show(msg,"Write To File", MessageBoxButtons.YesNo, MessageBoxIcon.Hand,
                MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                try
                {
                    if (chkCommuter.Checked)
                    {
                        Student localCommuter = new Student(Convert.ToInt32(txtStuID.Text), txtStuName.Text.Trim(), CreateAssignments());
                        DeleteItem();
                        studentList.Add(localCommuter);
                    }
                    else
                    {
                        DormStudent localDorm = new DormStudent(Convert.ToInt32(txtStuID.Text), txtStuName.Text.Trim(), cmbDorm.SelectedItem.ToString(), cmbMeal.SelectedItem.ToString()[0], CreateAssignments());
                        DeleteItem();
                        studentList.Add((Student)localDorm);
                    }
                    studentList.Sort();
                    ClearSearchPage();
                    WriteToFile();
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                
            }
            else
            {
                MessageBox.Show("New items not written");
            }

            if (MessageBox.Show("Do you want to continue editing this student?", "Page Redirect", MessageBoxButtons.YesNo, MessageBoxIcon.Hand,
                MessageBoxDefaultButton.Button2) != DialogResult.Yes)
            {
                ClearDetailsPage();
            }
        }

        private List<Assignment> CreateAssignments()
        {
            List<Assignment> theAssignments = new List<Assignment>();

            foreach (DataGridViewRow dr in gridGrades.Rows)
            {
                if (dr.Cells[0].Value != null)  //to avoid processing past the last datagridview row
                {
                    string assignmentName = dr.Cells[0].Value.ToString();
                    double pointsEarned = 0;
                    double pointsPossible = 0;
                    try
                    {
                        try
                        {
                            pointsEarned = Convert.ToDouble(dr.Cells[1].Value);
                        }
                        catch
                        {
                            MessageBox.Show("Points earned on " + assignmentName + " needs to be a number");
                        }

                        try
                        {
                            pointsPossible = Convert.ToDouble(dr.Cells[2].Value);
                        }
                        catch
                        {
                            MessageBox.Show("Points possible on " + assignmentName + " needs to be a number");
                        }

                        Assignment b = new Assignment(assignmentName, pointsEarned, pointsPossible);

                        theAssignments.Add(b);
                    }
                    catch(Exception e)
                    {
                        MessageBox.Show(e.Message);
                    }
                }

            }

            return theAssignments;
        }

        private int FindStudentIndex()
        {
            int i = 0;
            foreach (var item in studentList)
            {

                if (item.StudentId == Convert.ToInt32(txtStuID.Text))
                {
                    return i;
                }
                i++;
                if (i >= studentList.Count)
                {
                    return -1;
                }
            }
            return -1;
        }

        private void DeleteItem()
        {
            try
            {
                studentList.RemoveAt(FindStudentIndex());
            }
            catch { int a = 1; }
            

            ClearSearchPage();
        }

        private void WriteToFile()
        {
            try
            {
                FileStream outFile = new FileStream(filename,
                     FileMode.Create, FileAccess.Write);
                BinaryFormatter bf = new BinaryFormatter();

                foreach (var item in studentList)
                {
                    bf.Serialize(outFile, item);
                }
                outFile.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error writing list to file " + ex.Message);
            }
        }

        private void gridStudents_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            var theCell = gridStudents.SelectedCells;
            int theRowIndex = theCell[0].RowIndex;
            var theID = gridStudents.Rows[theRowIndex].Cells[0].Value;
            var theName = gridStudents.Rows[theRowIndex].Cells[1].Value;
            txtInitStuID.Text = theID.ToString();
            txtInitStuName.Text = theName.ToString();
            StudentFound();
        }

        private void txtInitID_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar < '0' || e.KeyChar > '9') &&
                (e.KeyChar != (char)Keys.Back) && (txtInitStuID.Text.Length < 4))
            {
                e.Handled = true;
            }
            
            
        }

        private void txtInitStuName_TextChanged(object sender, EventArgs e)
        {
            AddDataToStudents(-1, txtInitStuName.Text);
        }

        private void txtInitStuID_TextChanged(object sender, EventArgs e)
        {
            if (txtInitStuID.Text.Length < 1) {}
            else
            {
                int theID = Convert.ToInt32(txtInitStuID.Text);
                if (AddDataToStudents(theID, ""))
                {
                    StudentFound();
                }
                else
                {
                    NewStudent();
                }
            }
            
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to delete student " + txtInitStuID.Text + ", " + txtInitStuName.Text + "?",
                "Delete Student", MessageBoxButtons.YesNo, MessageBoxIcon.Hand,
                MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                txtStuID.Text = txtInitStuID.Text;
                DeleteItem();
                ClearDetailsPage();
                WriteToFile();
            }

        }
    }
}
