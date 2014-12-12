namespace FrbaHotel.Facturar_Publicaciones
{
    partial class FormFacturarPublicaciones
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
            this.buttonSearch = new System.Windows.Forms.Button();
            this.textBoxBooking = new System.Windows.Forms.TextBox();
            this.dgvStay = new System.Windows.Forms.DataGridView();
            this.buttonCharge = new System.Windows.Forms.Button();
            this.buttonBack = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvStay)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Nro Reserva";
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(301, 32);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 23);
            this.buttonSearch.TabIndex = 2;
            this.buttonSearch.Text = "Buscar";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // textBoxBooking
            // 
            this.textBoxBooking.Location = new System.Drawing.Point(105, 34);
            this.textBoxBooking.Name = "textBoxBooking";
            this.textBoxBooking.Size = new System.Drawing.Size(100, 20);
            this.textBoxBooking.TabIndex = 1;
            // 
            // dgvStay
            // 
            this.dgvStay.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvStay.Location = new System.Drawing.Point(25, 100);
            this.dgvStay.Name = "dgvStay";
            this.dgvStay.Size = new System.Drawing.Size(653, 150);
            this.dgvStay.TabIndex = 3;
            // 
            // buttonCharge
            // 
            this.buttonCharge.Location = new System.Drawing.Point(458, 278);
            this.buttonCharge.Name = "buttonCharge";
            this.buttonCharge.Size = new System.Drawing.Size(75, 23);
            this.buttonCharge.TabIndex = 4;
            this.buttonCharge.Text = "Ver Detalle";
            this.buttonCharge.UseVisualStyleBackColor = true;
            this.buttonCharge.Click += new System.EventHandler(this.buttonCharge_Click);
            // 
            // buttonBack
            // 
            this.buttonBack.Location = new System.Drawing.Point(166, 278);
            this.buttonBack.Name = "buttonBack";
            this.buttonBack.Size = new System.Drawing.Size(75, 23);
            this.buttonBack.TabIndex = 5;
            this.buttonBack.Text = "Volver";
            this.buttonBack.UseVisualStyleBackColor = true;
            this.buttonBack.Click += new System.EventHandler(this.buttonBack_Click);
            // 
            // FormFacturarPublicaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(708, 339);
            this.Controls.Add(this.buttonBack);
            this.Controls.Add(this.buttonCharge);
            this.Controls.Add(this.dgvStay);
            this.Controls.Add(this.textBoxBooking);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.label1);
            this.Name = "FormFacturarPublicaciones";
            this.Text = "Facturar Publicaciones";
            this.Load += new System.EventHandler(this.FormFacturarPublicaciones_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvStay)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.TextBox textBoxBooking;
        private System.Windows.Forms.DataGridView dgvStay;
        private System.Windows.Forms.Button buttonCharge;
        private System.Windows.Forms.Button buttonBack;
    }
}