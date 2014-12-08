namespace FrbaHotel.ABM_de_Usuario
{
    partial class FormABMUsuario
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
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.lblRol = new System.Windows.Forms.Label();
            this.comboBoxRol = new System.Windows.Forms.ComboBox();
            this.buttonClean = new System.Windows.Forms.Button();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.dgvUser = new System.Windows.Forms.DataGridView();
            this.buttonBack = new System.Windows.Forms.Button();
            this.buttonAdd = new System.Windows.Forms.Button();
            this.buttonDisable = new System.Windows.Forms.Button();
            this.buttonEdit = new System.Windows.Forms.Button();
            this.buttonEnable = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvUser)).BeginInit();
            this.SuspendLayout();
            // 
            // textBoxName
            // 
            this.textBoxName.Location = new System.Drawing.Point(79, 28);
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(121, 20);
            this.textBoxName.TabIndex = 0;
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(13, 31);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(44, 13);
            this.lblNombre.TabIndex = 1;
            this.lblNombre.Text = "Nombre";
            // 
            // lblRol
            // 
            this.lblRol.AutoSize = true;
            this.lblRol.Location = new System.Drawing.Point(457, 31);
            this.lblRol.Name = "lblRol";
            this.lblRol.Size = new System.Drawing.Size(23, 13);
            this.lblRol.TabIndex = 4;
            this.lblRol.Text = "Rol";
            // 
            // comboBoxRol
            // 
            this.comboBoxRol.FormattingEnabled = true;
            this.comboBoxRol.Location = new System.Drawing.Point(523, 28);
            this.comboBoxRol.Name = "comboBoxRol";
            this.comboBoxRol.Size = new System.Drawing.Size(121, 21);
            this.comboBoxRol.TabIndex = 5;
            // 
            // buttonClean
            // 
            this.buttonClean.Location = new System.Drawing.Point(29, 69);
            this.buttonClean.Name = "buttonClean";
            this.buttonClean.Size = new System.Drawing.Size(75, 23);
            this.buttonClean.TabIndex = 6;
            this.buttonClean.Text = "Limpiar";
            this.buttonClean.UseVisualStyleBackColor = true;
            this.buttonClean.Click += new System.EventHandler(this.buttonClean_Click);
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(548, 69);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 23);
            this.buttonSearch.TabIndex = 7;
            this.buttonSearch.Text = "Buscar";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // dgvUser
            // 
            this.dgvUser.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvUser.Location = new System.Drawing.Point(12, 108);
            this.dgvUser.Name = "dgvUser";
            this.dgvUser.Size = new System.Drawing.Size(692, 150);
            this.dgvUser.TabIndex = 8;
            // 
            // buttonBack
            // 
            this.buttonBack.Location = new System.Drawing.Point(29, 277);
            this.buttonBack.Name = "buttonBack";
            this.buttonBack.Size = new System.Drawing.Size(75, 23);
            this.buttonBack.TabIndex = 9;
            this.buttonBack.Text = "Volver";
            this.buttonBack.UseVisualStyleBackColor = true;
            this.buttonBack.Click += new System.EventHandler(this.buttonBack_Click);
            // 
            // buttonAdd
            // 
            this.buttonAdd.Location = new System.Drawing.Point(192, 277);
            this.buttonAdd.Name = "buttonAdd";
            this.buttonAdd.Size = new System.Drawing.Size(75, 23);
            this.buttonAdd.TabIndex = 10;
            this.buttonAdd.Text = "Crear";
            this.buttonAdd.UseVisualStyleBackColor = true;
            this.buttonAdd.Click += new System.EventHandler(this.buttonAdd_Click);
            // 
            // buttonDisable
            // 
            this.buttonDisable.Location = new System.Drawing.Point(488, 277);
            this.buttonDisable.Name = "buttonDisable";
            this.buttonDisable.Size = new System.Drawing.Size(75, 23);
            this.buttonDisable.TabIndex = 11;
            this.buttonDisable.Text = "Deshabilitar";
            this.buttonDisable.UseVisualStyleBackColor = true;
            this.buttonDisable.Click += new System.EventHandler(this.buttonDisable_Click);
            // 
            // buttonEdit
            // 
            this.buttonEdit.Location = new System.Drawing.Point(629, 277);
            this.buttonEdit.Name = "buttonEdit";
            this.buttonEdit.Size = new System.Drawing.Size(75, 23);
            this.buttonEdit.TabIndex = 12;
            this.buttonEdit.Text = "Modificar";
            this.buttonEdit.UseVisualStyleBackColor = true;
            this.buttonEdit.Click += new System.EventHandler(this.buttonEdit_Click);
            // 
            // buttonEnable
            // 
            this.buttonEnable.Location = new System.Drawing.Point(331, 277);
            this.buttonEnable.Name = "buttonEnable";
            this.buttonEnable.Size = new System.Drawing.Size(75, 23);
            this.buttonEnable.TabIndex = 13;
            this.buttonEnable.Text = "Habilitar";
            this.buttonEnable.UseVisualStyleBackColor = true;
            this.buttonEnable.Click += new System.EventHandler(this.buttonEnable_Click);
            // 
            // FormABMUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(716, 333);
            this.Controls.Add(this.buttonEnable);
            this.Controls.Add(this.buttonEdit);
            this.Controls.Add(this.buttonDisable);
            this.Controls.Add(this.buttonAdd);
            this.Controls.Add(this.buttonBack);
            this.Controls.Add(this.dgvUser);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.buttonClean);
            this.Controls.Add(this.comboBoxRol);
            this.Controls.Add(this.lblRol);
            this.Controls.Add(this.lblNombre);
            this.Controls.Add(this.textBoxName);
            this.Name = "FormABMUsuario";
            this.Text = "FormABMUsuario";
            this.Load += new System.EventHandler(this.FormABMUsuario_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvUser)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Label lblRol;
        private System.Windows.Forms.ComboBox comboBoxRol;
        private System.Windows.Forms.Button buttonClean;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.DataGridView dgvUser;
        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.Button buttonDisable;
        private System.Windows.Forms.Button buttonEdit;
        private System.Windows.Forms.Button buttonEnable;
    }
}