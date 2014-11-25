namespace FrbaHotel.ABM_de_Rol
{
    partial class FormABMRolModify
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
            this.lblName = new System.Windows.Forms.Label();
            this.txtRolDescription = new System.Windows.Forms.TextBox();
            this.dgvToAdd = new System.Windows.Forms.DataGridView();
            this.dgvSelected = new System.Windows.Forms.DataGridView();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.buttonSaveName = new System.Windows.Forms.Button();
            this.buttonAdd = new System.Windows.Forms.Button();
            this.buttonRemove = new System.Windows.Forms.Button();
            this.lblToAdd = new System.Windows.Forms.Label();
            this.lblSelected = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvToAdd)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSelected)).BeginInit();
            this.SuspendLayout();
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(20, 38);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(44, 13);
            this.lblName.TabIndex = 0;
            this.lblName.Text = "Nombre";
            // 
            // txtRolDescription
            // 
            this.txtRolDescription.Location = new System.Drawing.Point(81, 35);
            this.txtRolDescription.Name = "txtRolDescription";
            this.txtRolDescription.Size = new System.Drawing.Size(100, 20);
            this.txtRolDescription.TabIndex = 1;
            // 
            // dgvToAdd
            // 
            this.dgvToAdd.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvToAdd.Location = new System.Drawing.Point(16, 99);
            this.dgvToAdd.Name = "dgvToAdd";
            this.dgvToAdd.Size = new System.Drawing.Size(240, 150);
            this.dgvToAdd.TabIndex = 2;
            // 
            // dgvSelected
            // 
            this.dgvSelected.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSelected.Location = new System.Drawing.Point(328, 99);
            this.dgvSelected.Name = "dgvSelected";
            this.dgvSelected.Size = new System.Drawing.Size(240, 150);
            this.dgvSelected.TabIndex = 3;
            // 
            // buttonCancel
            // 
            this.buttonCancel.Location = new System.Drawing.Point(254, 289);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(75, 23);
            this.buttonCancel.TabIndex = 4;
            this.buttonCancel.Text = "Volver";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // buttonSaveName
            // 
            this.buttonSaveName.Location = new System.Drawing.Point(227, 33);
            this.buttonSaveName.Name = "buttonSaveName";
            this.buttonSaveName.Size = new System.Drawing.Size(141, 23);
            this.buttonSaveName.TabIndex = 5;
            this.buttonSaveName.Text = "Agregar Nombre";
            this.buttonSaveName.UseVisualStyleBackColor = true;
            this.buttonSaveName.Click += new System.EventHandler(this.buttonSaveName_Click);
            // 
            // buttonAdd
            // 
            this.buttonAdd.Location = new System.Drawing.Point(263, 115);
            this.buttonAdd.Name = "buttonAdd";
            this.buttonAdd.Size = new System.Drawing.Size(59, 23);
            this.buttonAdd.TabIndex = 6;
            this.buttonAdd.Text = "->";
            this.buttonAdd.UseVisualStyleBackColor = true;
            this.buttonAdd.Click += new System.EventHandler(this.buttonAdd_Click);
            // 
            // buttonRemove
            // 
            this.buttonRemove.Location = new System.Drawing.Point(263, 193);
            this.buttonRemove.Name = "buttonRemove";
            this.buttonRemove.Size = new System.Drawing.Size(59, 23);
            this.buttonRemove.TabIndex = 7;
            this.buttonRemove.Text = "<-";
            this.buttonRemove.UseVisualStyleBackColor = true;
            this.buttonRemove.Click += new System.EventHandler(this.buttonRemove_Click);
            // 
            // lblToAdd
            // 
            this.lblToAdd.AutoSize = true;
            this.lblToAdd.Location = new System.Drawing.Point(62, 74);
            this.lblToAdd.Name = "lblToAdd";
            this.lblToAdd.Size = new System.Drawing.Size(141, 13);
            this.lblToAdd.TabIndex = 8;
            this.lblToAdd.Text = "Funcionalidades Disponibles";
            // 
            // lblSelected
            // 
            this.lblSelected.AutoSize = true;
            this.lblSelected.Location = new System.Drawing.Point(378, 74);
            this.lblSelected.Name = "lblSelected";
            this.lblSelected.Size = new System.Drawing.Size(136, 13);
            this.lblSelected.TabIndex = 9;
            this.lblSelected.Text = "Funcionalidades Asignadas";
            // 
            // FormABMRolModify
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(613, 344);
            this.Controls.Add(this.lblSelected);
            this.Controls.Add(this.lblToAdd);
            this.Controls.Add(this.buttonRemove);
            this.Controls.Add(this.buttonAdd);
            this.Controls.Add(this.buttonSaveName);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.dgvSelected);
            this.Controls.Add(this.dgvToAdd);
            this.Controls.Add(this.txtRolDescription);
            this.Controls.Add(this.lblName);
            this.Name = "FormABMRolModify";
            this.Text = "ABM Rol";
            this.Load += new System.EventHandler(this.FormABMRolModify_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvToAdd)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSelected)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.TextBox txtRolDescription;
        private System.Windows.Forms.DataGridView dgvToAdd;
        private System.Windows.Forms.DataGridView dgvSelected;
        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.Button buttonSaveName;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.Button buttonRemove;
        private System.Windows.Forms.Label lblToAdd;
        private System.Windows.Forms.Label lblSelected;
    }
}