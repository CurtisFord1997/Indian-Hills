namespace Project4
{
    partial class StudentForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabGrp = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.gridStudents = new System.Windows.Forms.DataGridView();
            this.StuID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StuName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StuDorm = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.txtInitStuID = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtInitStuName = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.tabEditStudent = new System.Windows.Forms.TabPage();
            this.grpStuGrades = new System.Windows.Forms.GroupBox();
            this.gridGrades = new System.Windows.Forms.DataGridView();
            this.AssignmentName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PointsEarned = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PointsPossible = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grpStuDetails = new System.Windows.Forms.GroupBox();
            this.btnSubStu = new System.Windows.Forms.Button();
            this.grpDorm = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cmbMeal = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbDorm = new System.Windows.Forms.ComboBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.chkDorm = new System.Windows.Forms.CheckBox();
            this.chkCommuter = new System.Windows.Forms.CheckBox();
            this.txtStuID = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtStuName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tabGrp.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridStudents)).BeginInit();
            this.tabEditStudent.SuspendLayout();
            this.grpStuGrades.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridGrades)).BeginInit();
            this.grpStuDetails.SuspendLayout();
            this.grpDorm.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabGrp
            // 
            this.tabGrp.Controls.Add(this.tabPage1);
            this.tabGrp.Controls.Add(this.tabEditStudent);
            this.tabGrp.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabGrp.Location = new System.Drawing.Point(-1, -1);
            this.tabGrp.Name = "tabGrp";
            this.tabGrp.SelectedIndex = 0;
            this.tabGrp.Size = new System.Drawing.Size(802, 451);
            this.tabGrp.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.groupBox4);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(794, 423);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Select Student";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btnDelete);
            this.groupBox4.Controls.Add(this.btnAdd);
            this.groupBox4.Controls.Add(this.btnEdit);
            this.groupBox4.Controls.Add(this.gridStudents);
            this.groupBox4.Controls.Add(this.txtInitStuID);
            this.groupBox4.Controls.Add(this.label5);
            this.groupBox4.Controls.Add(this.txtInitStuName);
            this.groupBox4.Controls.Add(this.label6);
            this.groupBox4.Location = new System.Drawing.Point(6, 6);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(779, 417);
            this.groupBox4.TabIndex = 0;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Student Search";
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(266, 237);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.TabIndex = 11;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(145, 237);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 23);
            this.btnAdd.TabIndex = 10;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(35, 237);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(75, 23);
            this.btnEdit.TabIndex = 9;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // gridStudents
            // 
            this.gridStudents.AllowUserToAddRows = false;
            this.gridStudents.AllowUserToDeleteRows = false;
            this.gridStudents.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridStudents.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.StuID,
            this.StuName,
            this.StuDorm});
            this.gridStudents.Location = new System.Drawing.Point(387, 22);
            this.gridStudents.Name = "gridStudents";
            this.gridStudents.ReadOnly = true;
            this.gridStudents.Size = new System.Drawing.Size(376, 386);
            this.gridStudents.TabIndex = 8;
            this.gridStudents.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.gridStudents_CellContentClick);
            // 
            // StuID
            // 
            this.StuID.HeaderText = "Student ID";
            this.StuID.Name = "StuID";
            this.StuID.ReadOnly = true;
            // 
            // StuName
            // 
            this.StuName.HeaderText = "Student Name";
            this.StuName.Name = "StuName";
            this.StuName.ReadOnly = true;
            // 
            // StuDorm
            // 
            this.StuDorm.HeaderText = "Dorm Student";
            this.StuDorm.Name = "StuDorm";
            this.StuDorm.ReadOnly = true;
            // 
            // txtInitStuID
            // 
            this.txtInitStuID.Location = new System.Drawing.Point(116, 167);
            this.txtInitStuID.Name = "txtInitStuID";
            this.txtInitStuID.Size = new System.Drawing.Size(225, 22);
            this.txtInitStuID.TabIndex = 7;
            this.txtInitStuID.TextChanged += new System.EventHandler(this.txtInitStuID_TextChanged);
            this.txtInitStuID.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtInitID_KeyPress);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(17, 170);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(69, 16);
            this.label5.TabIndex = 6;
            this.label5.Text = "Student ID";
            // 
            // txtInitStuName
            // 
            this.txtInitStuName.Location = new System.Drawing.Point(116, 126);
            this.txtInitStuName.Name = "txtInitStuName";
            this.txtInitStuName.Size = new System.Drawing.Size(225, 22);
            this.txtInitStuName.TabIndex = 5;
            this.txtInitStuName.TextChanged += new System.EventHandler(this.txtInitStuName_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(17, 129);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(93, 16);
            this.label6.TabIndex = 4;
            this.label6.Text = "Student Name";
            // 
            // tabEditStudent
            // 
            this.tabEditStudent.Controls.Add(this.btnSubStu);
            this.tabEditStudent.Controls.Add(this.grpStuGrades);
            this.tabEditStudent.Controls.Add(this.grpStuDetails);
            this.tabEditStudent.Location = new System.Drawing.Point(4, 25);
            this.tabEditStudent.Name = "tabEditStudent";
            this.tabEditStudent.Padding = new System.Windows.Forms.Padding(3);
            this.tabEditStudent.Size = new System.Drawing.Size(794, 422);
            this.tabEditStudent.TabIndex = 1;
            this.tabEditStudent.Text = "Edit Student";
            this.tabEditStudent.UseVisualStyleBackColor = true;
            // 
            // grpStuGrades
            // 
            this.grpStuGrades.Controls.Add(this.gridGrades);
            this.grpStuGrades.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpStuGrades.Location = new System.Drawing.Point(404, 7);
            this.grpStuGrades.Name = "grpStuGrades";
            this.grpStuGrades.Size = new System.Drawing.Size(376, 351);
            this.grpStuGrades.TabIndex = 3;
            this.grpStuGrades.TabStop = false;
            this.grpStuGrades.Text = "Grades";
            // 
            // gridGrades
            // 
            this.gridGrades.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridGrades.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.AssignmentName,
            this.PointsEarned,
            this.PointsPossible});
            this.gridGrades.Location = new System.Drawing.Point(7, 22);
            this.gridGrades.Name = "gridGrades";
            this.gridGrades.Size = new System.Drawing.Size(363, 308);
            this.gridGrades.TabIndex = 0;
            // 
            // AssignmentName
            // 
            this.AssignmentName.HeaderText = "Assignment Name";
            this.AssignmentName.Name = "AssignmentName";
            // 
            // PointsEarned
            // 
            this.PointsEarned.HeaderText = "Points Earned";
            this.PointsEarned.Name = "PointsEarned";
            // 
            // PointsPossible
            // 
            this.PointsPossible.HeaderText = "Points Possible";
            this.PointsPossible.Name = "PointsPossible";
            // 
            // grpStuDetails
            // 
            this.grpStuDetails.Controls.Add(this.grpDorm);
            this.grpStuDetails.Controls.Add(this.groupBox3);
            this.grpStuDetails.Controls.Add(this.txtStuID);
            this.grpStuDetails.Controls.Add(this.label2);
            this.grpStuDetails.Controls.Add(this.txtStuName);
            this.grpStuDetails.Controls.Add(this.label1);
            this.grpStuDetails.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpStuDetails.Location = new System.Drawing.Point(15, 7);
            this.grpStuDetails.Name = "grpStuDetails";
            this.grpStuDetails.Size = new System.Drawing.Size(382, 351);
            this.grpStuDetails.TabIndex = 2;
            this.grpStuDetails.TabStop = false;
            this.grpStuDetails.Text = "Student Details";
            // 
            // btnSubStu
            // 
            this.btnSubStu.Location = new System.Drawing.Point(308, 374);
            this.btnSubStu.Name = "btnSubStu";
            this.btnSubStu.Size = new System.Drawing.Size(183, 28);
            this.btnSubStu.TabIndex = 6;
            this.btnSubStu.Text = "Submit Changes";
            this.btnSubStu.UseVisualStyleBackColor = true;
            this.btnSubStu.Click += new System.EventHandler(this.btnSubStu_Click);
            // 
            // grpDorm
            // 
            this.grpDorm.Controls.Add(this.label4);
            this.grpDorm.Controls.Add(this.cmbMeal);
            this.grpDorm.Controls.Add(this.label3);
            this.grpDorm.Controls.Add(this.cmbDorm);
            this.grpDorm.Enabled = false;
            this.grpDorm.Location = new System.Drawing.Point(30, 204);
            this.grpDorm.Name = "grpDorm";
            this.grpDorm.Size = new System.Drawing.Size(321, 126);
            this.grpDorm.TabIndex = 5;
            this.grpDorm.TabStop = false;
            this.grpDorm.Text = "Dorm Student Information";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 80);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 16);
            this.label4.TabIndex = 3;
            this.label4.Text = "Meal Plan";
            // 
            // cmbMeal
            // 
            this.cmbMeal.FormattingEnabled = true;
            this.cmbMeal.Items.AddRange(new object[] {
            "Basic",
            "Medium",
            "High"});
            this.cmbMeal.Location = new System.Drawing.Point(127, 76);
            this.cmbMeal.Name = "cmbMeal";
            this.cmbMeal.Size = new System.Drawing.Size(188, 24);
            this.cmbMeal.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 36);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(95, 16);
            this.label3.TabIndex = 1;
            this.label3.Text = "Dorm Location";
            // 
            // cmbDorm
            // 
            this.cmbDorm.FormattingEnabled = true;
            this.cmbDorm.Items.AddRange(new object[] {
            "Oak",
            "Trustee",
            "Wapello",
            "Appanoose",
            "Mahaska"});
            this.cmbDorm.Location = new System.Drawing.Point(127, 32);
            this.cmbDorm.Name = "cmbDorm";
            this.cmbDorm.Size = new System.Drawing.Size(188, 24);
            this.cmbDorm.TabIndex = 0;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.chkDorm);
            this.groupBox3.Controls.Add(this.chkCommuter);
            this.groupBox3.Location = new System.Drawing.Point(30, 136);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(321, 48);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Student Residency";
            // 
            // chkDorm
            // 
            this.chkDorm.AutoSize = true;
            this.chkDorm.Location = new System.Drawing.Point(176, 21);
            this.chkDorm.Name = "chkDorm";
            this.chkDorm.Size = new System.Drawing.Size(60, 20);
            this.chkDorm.TabIndex = 1;
            this.chkDorm.Text = "Dorm";
            this.chkDorm.UseVisualStyleBackColor = true;
            this.chkDorm.CheckedChanged += new System.EventHandler(this.chkDorm_CheckedChanged);
            // 
            // chkCommuter
            // 
            this.chkCommuter.AutoSize = true;
            this.chkCommuter.Location = new System.Drawing.Point(45, 21);
            this.chkCommuter.Name = "chkCommuter";
            this.chkCommuter.Size = new System.Drawing.Size(88, 20);
            this.chkCommuter.TabIndex = 0;
            this.chkCommuter.Text = "Commuter";
            this.chkCommuter.UseVisualStyleBackColor = true;
            this.chkCommuter.CheckedChanged += new System.EventHandler(this.chkCommuter_CheckedChanged);
            // 
            // txtStuID
            // 
            this.txtStuID.Location = new System.Drawing.Point(126, 76);
            this.txtStuID.Name = "txtStuID";
            this.txtStuID.Size = new System.Drawing.Size(225, 22);
            this.txtStuID.TabIndex = 3;
            this.txtStuID.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(27, 79);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "Student ID";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // txtStuName
            // 
            this.txtStuName.Location = new System.Drawing.Point(126, 35);
            this.txtStuName.Name = "txtStuName";
            this.txtStuName.Size = new System.Drawing.Size(225, 22);
            this.txtStuName.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(27, 38);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(93, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Student Name";
            // 
            // StudentForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tabGrp);
            this.Name = "StudentForm";
            this.Text = "StudentForm";
            this.Load += new System.EventHandler(this.StudentForm_Load);
            this.tabGrp.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridStudents)).EndInit();
            this.tabEditStudent.ResumeLayout(false);
            this.grpStuGrades.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gridGrades)).EndInit();
            this.grpStuDetails.ResumeLayout(false);
            this.grpStuDetails.PerformLayout();
            this.grpDorm.ResumeLayout(false);
            this.grpDorm.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabGrp;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabEditStudent;
        private System.Windows.Forms.GroupBox grpStuGrades;
        private System.Windows.Forms.GroupBox grpStuDetails;
        private System.Windows.Forms.TextBox txtStuName;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtStuID;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox grpDorm;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cmbMeal;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmbDorm;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.CheckBox chkDorm;
        private System.Windows.Forms.CheckBox chkCommuter;
        private System.Windows.Forms.DataGridView gridGrades;
        private System.Windows.Forms.Button btnSubStu;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.DataGridView gridStudents;
        private System.Windows.Forms.TextBox txtInitStuID;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtInitStuName;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DataGridViewTextBoxColumn AssignmentName;
        private System.Windows.Forms.DataGridViewTextBoxColumn PointsEarned;
        private System.Windows.Forms.DataGridViewTextBoxColumn PointsPossible;
        private System.Windows.Forms.DataGridViewTextBoxColumn StuID;
        private System.Windows.Forms.DataGridViewTextBoxColumn StuName;
        private System.Windows.Forms.DataGridViewCheckBoxColumn StuDorm;
    }
}