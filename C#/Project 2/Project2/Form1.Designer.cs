namespace Project2
{
    partial class Form1
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
            this.label1 = new System.Windows.Forms.Label();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.btnSubJob = new System.Windows.Forms.Button();
            this.txtRate = new System.Windows.Forms.TextBox();
            this.txtHours = new System.Windows.Forms.TextBox();
            this.txtDesc = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tabCombJob = new System.Windows.Forms.TabPage();
            this.txtCombined = new System.Windows.Forms.TextBox();
            this.btnCombine = new System.Windows.Forms.Button();
            this.comCombineJob2 = new System.Windows.Forms.ComboBox();
            this.comCombineJob1 = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.btnViewJobs = new System.Windows.Forms.Button();
            this.lstViewJobs = new System.Windows.Forms.ListBox();
            this.btnJobRefresh = new System.Windows.Forms.Button();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabCombJob.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(164, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(471, 46);
            this.label1.TabIndex = 0;
            this.label1.Text = "Harold\'s Home Services";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabCombJob);
            this.tabControl1.Location = new System.Drawing.Point(13, 61);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(775, 377);
            this.tabControl1.TabIndex = 1;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.btnSubJob);
            this.tabPage1.Controls.Add(this.txtRate);
            this.tabPage1.Controls.Add(this.txtHours);
            this.tabPage1.Controls.Add(this.txtDesc);
            this.tabPage1.Controls.Add(this.label4);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(767, 348);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Add Job";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // btnSubJob
            // 
            this.btnSubJob.Location = new System.Drawing.Point(330, 186);
            this.btnSubJob.Name = "btnSubJob";
            this.btnSubJob.Size = new System.Drawing.Size(75, 23);
            this.btnSubJob.TabIndex = 6;
            this.btnSubJob.Text = "Submit";
            this.btnSubJob.UseVisualStyleBackColor = true;
            this.btnSubJob.Click += new System.EventHandler(this.button1_Click);
            // 
            // txtRate
            // 
            this.txtRate.Location = new System.Drawing.Point(348, 124);
            this.txtRate.Name = "txtRate";
            this.txtRate.Size = new System.Drawing.Size(174, 22);
            this.txtRate.TabIndex = 5;
            // 
            // txtHours
            // 
            this.txtHours.Location = new System.Drawing.Point(348, 74);
            this.txtHours.Name = "txtHours";
            this.txtHours.Size = new System.Drawing.Size(174, 22);
            this.txtHours.TabIndex = 4;
            // 
            // txtDesc
            // 
            this.txtDesc.Location = new System.Drawing.Point(348, 27);
            this.txtDesc.Name = "txtDesc";
            this.txtDesc.Size = new System.Drawing.Size(174, 22);
            this.txtDesc.TabIndex = 3;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(223, 129);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(83, 17);
            this.label4.TabIndex = 2;
            this.label4.Text = "Hourly Rate";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(220, 79);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(73, 17);
            this.label3.TabIndex = 1;
            this.label3.Text = "Job Hours";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(220, 33);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(106, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "Job Description";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.lstViewJobs);
            this.tabPage2.Controls.Add(this.btnViewJobs);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(767, 348);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Display All Jobs";
            this.tabPage2.UseVisualStyleBackColor = true;
            this.tabPage2.Click += new System.EventHandler(this.tabPage2_Click);
            // 
            // tabCombJob
            // 
            this.tabCombJob.Controls.Add(this.btnJobRefresh);
            this.tabCombJob.Controls.Add(this.txtCombined);
            this.tabCombJob.Controls.Add(this.btnCombine);
            this.tabCombJob.Controls.Add(this.comCombineJob2);
            this.tabCombJob.Controls.Add(this.comCombineJob1);
            this.tabCombJob.Controls.Add(this.label6);
            this.tabCombJob.Controls.Add(this.label5);
            this.tabCombJob.Location = new System.Drawing.Point(4, 25);
            this.tabCombJob.Name = "tabCombJob";
            this.tabCombJob.Padding = new System.Windows.Forms.Padding(3);
            this.tabCombJob.Size = new System.Drawing.Size(767, 348);
            this.tabCombJob.TabIndex = 2;
            this.tabCombJob.Text = "Combine Jobs";
            this.tabCombJob.UseVisualStyleBackColor = true;
            this.tabCombJob.Click += new System.EventHandler(this.tabCombJob_Click);
            // 
            // txtCombined
            // 
            this.txtCombined.Location = new System.Drawing.Point(246, 198);
            this.txtCombined.Name = "txtCombined";
            this.txtCombined.Size = new System.Drawing.Size(250, 22);
            this.txtCombined.TabIndex = 5;
            // 
            // btnCombine
            // 
            this.btnCombine.Location = new System.Drawing.Point(292, 104);
            this.btnCombine.Name = "btnCombine";
            this.btnCombine.Size = new System.Drawing.Size(158, 73);
            this.btnCombine.TabIndex = 4;
            this.btnCombine.Text = "Combine!";
            this.btnCombine.UseVisualStyleBackColor = true;
            this.btnCombine.Click += new System.EventHandler(this.btnCombine_Click);
            // 
            // comCombineJob2
            // 
            this.comCombineJob2.FormattingEnabled = true;
            this.comCombineJob2.Location = new System.Drawing.Point(421, 64);
            this.comCombineJob2.Name = "comCombineJob2";
            this.comCombineJob2.Size = new System.Drawing.Size(267, 24);
            this.comCombineJob2.TabIndex = 3;
            this.comCombineJob2.SelectedIndexChanged += new System.EventHandler(this.comCombineJob2_SelectedIndexChanged);
            // 
            // comCombineJob1
            // 
            this.comCombineJob1.FormattingEnabled = true;
            this.comCombineJob1.Location = new System.Drawing.Point(46, 64);
            this.comCombineJob1.Name = "comCombineJob1";
            this.comCombineJob1.Size = new System.Drawing.Size(267, 24);
            this.comCombineJob1.TabIndex = 2;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(544, 44);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(43, 17);
            this.label6.TabIndex = 1;
            this.label6.Text = "Job 2";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(152, 44);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(43, 17);
            this.label5.TabIndex = 0;
            this.label5.Text = "Job 1";
            // 
            // btnViewJobs
            // 
            this.btnViewJobs.Location = new System.Drawing.Point(23, 18);
            this.btnViewJobs.Name = "btnViewJobs";
            this.btnViewJobs.Size = new System.Drawing.Size(114, 25);
            this.btnViewJobs.TabIndex = 1;
            this.btnViewJobs.Text = "View Jobs";
            this.btnViewJobs.UseVisualStyleBackColor = true;
            this.btnViewJobs.Click += new System.EventHandler(this.btnViewJobs_Click);
            // 
            // lstViewJobs
            // 
            this.lstViewJobs.FormattingEnabled = true;
            this.lstViewJobs.ItemHeight = 16;
            this.lstViewJobs.Location = new System.Drawing.Point(23, 58);
            this.lstViewJobs.Name = "lstViewJobs";
            this.lstViewJobs.Size = new System.Drawing.Size(717, 260);
            this.lstViewJobs.TabIndex = 3;
            // 
            // btnJobRefresh
            // 
            this.btnJobRefresh.Location = new System.Drawing.Point(292, 15);
            this.btnJobRefresh.Name = "btnJobRefresh";
            this.btnJobRefresh.Size = new System.Drawing.Size(158, 43);
            this.btnJobRefresh.TabIndex = 6;
            this.btnJobRefresh.Text = "Refresh Jobs";
            this.btnJobRefresh.UseVisualStyleBackColor = true;
            this.btnJobRefresh.Click += new System.EventHandler(this.btnJobRefresh_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabCombJob.ResumeLayout(false);
            this.tabCombJob.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Button btnSubJob;
        private System.Windows.Forms.TextBox txtRate;
        private System.Windows.Forms.TextBox txtHours;
        private System.Windows.Forms.TextBox txtDesc;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabCombJob;
        private System.Windows.Forms.TextBox txtCombined;
        private System.Windows.Forms.Button btnCombine;
        private System.Windows.Forms.ComboBox comCombineJob2;
        private System.Windows.Forms.ComboBox comCombineJob1;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnViewJobs;
        private System.Windows.Forms.ListBox lstViewJobs;
        private System.Windows.Forms.Button btnJobRefresh;
    }
}