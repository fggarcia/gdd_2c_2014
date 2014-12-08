namespace FrbaHotel.Registrar_Consumible
{
    partial class FormABMConsumibles
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
            this.lblEstadia = new System.Windows.Forms.Label();
            this.txtNroReserva = new System.Windows.Forms.TextBox();
            this.btnSearch = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnSelect = new System.Windows.Forms.Button();
            this.dgvEstadias = new System.Windows.Forms.DataGridView();
            this.btnClean = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEstadias)).BeginInit();
            this.SuspendLayout();
            // 
            // lblEstadia
            // 
            this.lblEstadia.AutoSize = true;
            this.lblEstadia.Location = new System.Drawing.Point(38, 32);
            this.lblEstadia.Name = "lblEstadia";
            this.lblEstadia.Size = new System.Drawing.Size(67, 13);
            this.lblEstadia.TabIndex = 0;
            this.lblEstadia.Text = "Nro Reserva";
            // 
            // txtNroReserva
            // 
            this.txtNroReserva.Location = new System.Drawing.Point(111, 29);
            this.txtNroReserva.Name = "txtNroReserva";
            this.txtNroReserva.Size = new System.Drawing.Size(135, 20);
            this.txtNroReserva.TabIndex = 1;
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(315, 27);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(101, 23);
            this.btnSearch.TabIndex = 2;
            this.btnSearch.Text = "Buscar";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(41, 341);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.TabIndex = 3;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnSelect
            // 
            this.btnSelect.Location = new System.Drawing.Point(241, 341);
            this.btnSelect.Name = "btnSelect";
            this.btnSelect.Size = new System.Drawing.Size(131, 23);
            this.btnSelect.TabIndex = 4;
            this.btnSelect.Text = "Ver Consumibles";
            this.btnSelect.UseVisualStyleBackColor = true;
            this.btnSelect.Click += new System.EventHandler(this.btnSelect_Click);
            // 
            // dgvEstadias
            // 
            this.dgvEstadias.AllowUserToAddRows = false;
            this.dgvEstadias.AllowUserToDeleteRows = false;
            this.dgvEstadias.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvEstadias.Location = new System.Drawing.Point(41, 118);
            this.dgvEstadias.Name = "dgvEstadias";
            this.dgvEstadias.ReadOnly = true;
            this.dgvEstadias.Size = new System.Drawing.Size(409, 198);
            this.dgvEstadias.TabIndex = 5;
            // 
            // btnClean
            // 
            this.btnClean.Location = new System.Drawing.Point(41, 67);
            this.btnClean.Name = "btnClean";
            this.btnClean.Size = new System.Drawing.Size(75, 23);
            this.btnClean.TabIndex = 6;
            this.btnClean.Text = "Limpiar";
            this.btnClean.UseVisualStyleBackColor = true;
            this.btnClean.Click += new System.EventHandler(this.btnClean_Click);
            // 
            // FormABMConsumibles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(493, 395);
            this.Controls.Add(this.btnClean);
            this.Controls.Add(this.dgvEstadias);
            this.Controls.Add(this.btnSelect);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.txtNroReserva);
            this.Controls.Add(this.lblEstadia);
            this.Name = "FormABMConsumibles";
            this.Text = "FormABMConsumibles";
            this.Load += new System.EventHandler(this.FormABMConsumibles_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvEstadias)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblEstadia;
        private System.Windows.Forms.TextBox txtNroReserva;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnSelect;
        private System.Windows.Forms.DataGridView dgvEstadias;
        private System.Windows.Forms.Button btnClean;
    }
}