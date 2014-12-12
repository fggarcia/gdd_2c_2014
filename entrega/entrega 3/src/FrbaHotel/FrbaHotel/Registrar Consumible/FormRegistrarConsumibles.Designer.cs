namespace FrbaHotel.Registrar_Consumible
{
    partial class FormRegistrarConsumibles
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
            this.lblSelected = new System.Windows.Forms.Label();
            this.lblConsumibles = new System.Windows.Forms.Label();
            this.btnRemove = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnFilter = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.dgvSelected = new System.Windows.Forms.DataGridView();
            this.dgvConsumiblesList = new System.Windows.Forms.DataGridView();
            this.txtConsumibles = new System.Windows.Forms.TextBox();
            this.lblName = new System.Windows.Forms.Label();
            this.lblCantidad = new System.Windows.Forms.Label();
            this.txtCantidad = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSelected)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvConsumiblesList)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSelected
            // 
            this.lblSelected.AutoSize = true;
            this.lblSelected.Location = new System.Drawing.Point(443, 134);
            this.lblSelected.Name = "lblSelected";
            this.lblSelected.Size = new System.Drawing.Size(118, 13);
            this.lblSelected.TabIndex = 19;
            this.lblSelected.Text = "Consumibles Asignados";
            // 
            // lblConsumibles
            // 
            this.lblConsumibles.AutoSize = true;
            this.lblConsumibles.Location = new System.Drawing.Point(69, 134);
            this.lblConsumibles.Name = "lblConsumibles";
            this.lblConsumibles.Size = new System.Drawing.Size(123, 13);
            this.lblConsumibles.TabIndex = 18;
            this.lblConsumibles.Text = "Consumibles Disponibles";
            // 
            // btnRemove
            // 
            this.btnRemove.Location = new System.Drawing.Point(270, 253);
            this.btnRemove.Name = "btnRemove";
            this.btnRemove.Size = new System.Drawing.Size(59, 23);
            this.btnRemove.TabIndex = 17;
            this.btnRemove.Text = "<-";
            this.btnRemove.UseVisualStyleBackColor = true;
            this.btnRemove.Click += new System.EventHandler(this.btnRemove_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(270, 175);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(59, 23);
            this.btnAdd.TabIndex = 16;
            this.btnAdd.Text = "->";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnFilter
            // 
            this.btnFilter.Location = new System.Drawing.Point(250, 32);
            this.btnFilter.Name = "btnFilter";
            this.btnFilter.Size = new System.Drawing.Size(141, 23);
            this.btnFilter.TabIndex = 15;
            this.btnFilter.Text = "Filtrar";
            this.btnFilter.UseVisualStyleBackColor = true;
            this.btnFilter.Click += new System.EventHandler(this.btnFilter_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(261, 349);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 14;
            this.btnCancel.Text = "Volver";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // dgvSelected
            // 
            this.dgvSelected.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSelected.Location = new System.Drawing.Point(335, 159);
            this.dgvSelected.Name = "dgvSelected";
            this.dgvSelected.Size = new System.Drawing.Size(305, 150);
            this.dgvSelected.TabIndex = 13;
            // 
            // dgvConsumiblesList
            // 
            this.dgvConsumiblesList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvConsumiblesList.Location = new System.Drawing.Point(23, 159);
            this.dgvConsumiblesList.Name = "dgvConsumiblesList";
            this.dgvConsumiblesList.Size = new System.Drawing.Size(240, 150);
            this.dgvConsumiblesList.TabIndex = 12;
            // 
            // txtConsumibles
            // 
            this.txtConsumibles.Location = new System.Drawing.Point(88, 34);
            this.txtConsumibles.Name = "txtConsumibles";
            this.txtConsumibles.Size = new System.Drawing.Size(140, 20);
            this.txtConsumibles.TabIndex = 11;
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(27, 37);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(44, 13);
            this.lblName.TabIndex = 10;
            this.lblName.Text = "Nombre";
            // 
            // lblCantidad
            // 
            this.lblCantidad.AutoSize = true;
            this.lblCantidad.Location = new System.Drawing.Point(27, 78);
            this.lblCantidad.Name = "lblCantidad";
            this.lblCantidad.Size = new System.Drawing.Size(49, 13);
            this.lblCantidad.TabIndex = 20;
            this.lblCantidad.Text = "Cantidad";
            // 
            // txtCantidad
            // 
            this.txtCantidad.Location = new System.Drawing.Point(88, 75);
            this.txtCantidad.Name = "txtCantidad";
            this.txtCantidad.Size = new System.Drawing.Size(59, 20);
            this.txtCantidad.TabIndex = 21;
            // 
            // FormRegistrarConsumibles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(652, 399);
            this.Controls.Add(this.txtCantidad);
            this.Controls.Add(this.lblCantidad);
            this.Controls.Add(this.lblSelected);
            this.Controls.Add(this.lblConsumibles);
            this.Controls.Add(this.btnRemove);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnFilter);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.dgvSelected);
            this.Controls.Add(this.dgvConsumiblesList);
            this.Controls.Add(this.txtConsumibles);
            this.Controls.Add(this.lblName);
            this.Name = "FormRegistrarConsumibles";
            this.Text = "FormRegistrarConsumibles";
            this.Load += new System.EventHandler(this.FormRegistrarConsumibles_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSelected)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvConsumiblesList)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblConsumibles;
        private System.Windows.Forms.Button btnRemove;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnFilter;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.DataGridView dgvSelected;
        private System.Windows.Forms.DataGridView dgvConsumiblesList;
        private System.Windows.Forms.TextBox txtConsumibles;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Label lblSelected;
        private System.Windows.Forms.Label lblCantidad;
        private System.Windows.Forms.TextBox txtCantidad;
    }
}