namespace FrbaHotel.ABM_de_Reserva
{
    partial class FormAltaReserva
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
            this.dTDesde = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dTHasta = new System.Windows.Forms.DateTimePicker();
            this.dgvRegimen = new System.Windows.Forms.DataGridView();
            this.label4 = new System.Windows.Forms.Label();
            this.button_consultar = new System.Windows.Forms.Button();
            this.button_volver = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimen)).BeginInit();
            this.SuspendLayout();
            // 
            // dTDesde
            // 
            this.dTDesde.Location = new System.Drawing.Point(116, 23);
            this.dTDesde.Name = "dTDesde";
            this.dTDesde.Size = new System.Drawing.Size(190, 20);
            this.dTDesde.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Fecha Desde:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(23, 74);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(71, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Fecha Hasta:";
            // 
            // dTHasta
            // 
            this.dTHasta.Location = new System.Drawing.Point(116, 74);
            this.dTHasta.Name = "dTHasta";
            this.dTHasta.Size = new System.Drawing.Size(190, 20);
            this.dTHasta.TabIndex = 2;
            // 
            // dgvRegimen
            // 
            this.dgvRegimen.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRegimen.Location = new System.Drawing.Point(12, 148);
            this.dgvRegimen.Name = "dgvRegimen";
            this.dgvRegimen.Size = new System.Drawing.Size(422, 134);
            this.dgvRegimen.TabIndex = 6;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(188, 121);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(77, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Regimen Hotel";
            // 
            // button_consultar
            // 
            this.button_consultar.Location = new System.Drawing.Point(346, 12);
            this.button_consultar.Name = "button_consultar";
            this.button_consultar.Size = new System.Drawing.Size(88, 35);
            this.button_consultar.TabIndex = 8;
            this.button_consultar.Text = "Consultar";
            this.button_consultar.UseVisualStyleBackColor = true;
            // 
            // button_volver
            // 
            this.button_volver.Location = new System.Drawing.Point(346, 63);
            this.button_volver.Name = "button_volver";
            this.button_volver.Size = new System.Drawing.Size(88, 35);
            this.button_volver.TabIndex = 9;
            this.button_volver.Text = "Volver";
            this.button_volver.UseVisualStyleBackColor = true;
            this.button_volver.Click += new System.EventHandler(this.button_volver_Click);
            // 
            // FormAltaReserva
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(446, 325);
            this.Controls.Add(this.button_volver);
            this.Controls.Add(this.button_consultar);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dgvRegimen);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dTHasta);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dTDesde);
            this.Name = "FormAltaReserva";
            this.Text = "FormAltaReserva";
            this.Load += new System.EventHandler(this.FormAltaReserva_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvRegimen)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dTDesde;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dTHasta;
        private System.Windows.Forms.DataGridView dgvRegimen;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button button_consultar;
        private System.Windows.Forms.Button button_volver;
    }
}