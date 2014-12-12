namespace FrbaHotel.Facturar_Publicaciones
{
    partial class FormFacturarPublicacionesDetail
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
            this.lblStayId = new System.Windows.Forms.Label();
            this.textBoxStayId = new System.Windows.Forms.TextBox();
            this.lblName = new System.Windows.Forms.Label();
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.lblLastName = new System.Windows.Forms.Label();
            this.textBoxLastName = new System.Windows.Forms.TextBox();
            this.lblTypePay = new System.Windows.Forms.Label();
            this.comboBoxTypePay = new System.Windows.Forms.ComboBox();
            this.lblCardNumber = new System.Windows.Forms.Label();
            this.textBoxCardNumber = new System.Windows.Forms.TextBox();
            this.lblClientId = new System.Windows.Forms.Label();
            this.textBoxClientId = new System.Windows.Forms.TextBox();
            this.dgvChargeDetail = new System.Windows.Forms.DataGridView();
            this.buttonCharge = new System.Windows.Forms.Button();
            this.lblTotal = new System.Windows.Forms.Label();
            this.textBoxTotalCharge = new System.Windows.Forms.TextBox();
            this.buttonCancel = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvChargeDetail)).BeginInit();
            this.SuspendLayout();
            // 
            // lblStayId
            // 
            this.lblStayId.AutoSize = true;
            this.lblStayId.Location = new System.Drawing.Point(38, 54);
            this.lblStayId.Name = "lblStayId";
            this.lblStayId.Size = new System.Drawing.Size(54, 13);
            this.lblStayId.TabIndex = 0;
            this.lblStayId.Text = "Id Estadia";
            // 
            // textBoxStayId
            // 
            this.textBoxStayId.Location = new System.Drawing.Point(126, 51);
            this.textBoxStayId.Name = "textBoxStayId";
            this.textBoxStayId.Size = new System.Drawing.Size(121, 20);
            this.textBoxStayId.TabIndex = 1;
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(38, 91);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(44, 13);
            this.lblName.TabIndex = 2;
            this.lblName.Text = "Nombre";
            // 
            // textBoxName
            // 
            this.textBoxName.Location = new System.Drawing.Point(126, 88);
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(121, 20);
            this.textBoxName.TabIndex = 3;
            // 
            // lblLastName
            // 
            this.lblLastName.AutoSize = true;
            this.lblLastName.Location = new System.Drawing.Point(379, 90);
            this.lblLastName.Name = "lblLastName";
            this.lblLastName.Size = new System.Drawing.Size(44, 13);
            this.lblLastName.TabIndex = 4;
            this.lblLastName.Text = "Apellido";
            // 
            // textBoxLastName
            // 
            this.textBoxLastName.Location = new System.Drawing.Point(448, 87);
            this.textBoxLastName.Name = "textBoxLastName";
            this.textBoxLastName.Size = new System.Drawing.Size(112, 20);
            this.textBoxLastName.TabIndex = 5;
            // 
            // lblTypePay
            // 
            this.lblTypePay.AutoSize = true;
            this.lblTypePay.Location = new System.Drawing.Point(38, 131);
            this.lblTypePay.Name = "lblTypePay";
            this.lblTypePay.Size = new System.Drawing.Size(56, 13);
            this.lblTypePay.TabIndex = 6;
            this.lblTypePay.Text = "Tipo Pago";
            // 
            // comboBoxTypePay
            // 
            this.comboBoxTypePay.FormattingEnabled = true;
            this.comboBoxTypePay.Location = new System.Drawing.Point(126, 128);
            this.comboBoxTypePay.Name = "comboBoxTypePay";
            this.comboBoxTypePay.Size = new System.Drawing.Size(121, 21);
            this.comboBoxTypePay.TabIndex = 1;
            this.comboBoxTypePay.SelectedIndexChanged += new System.EventHandler(this.comboBoxTypePay_SelectedIndexChanged);
            // 
            // lblCardNumber
            // 
            this.lblCardNumber.AutoSize = true;
            this.lblCardNumber.Location = new System.Drawing.Point(382, 131);
            this.lblCardNumber.Name = "lblCardNumber";
            this.lblCardNumber.Size = new System.Drawing.Size(40, 13);
            this.lblCardNumber.TabIndex = 8;
            this.lblCardNumber.Text = "Tarjeta";
            // 
            // textBoxCardNumber
            // 
            this.textBoxCardNumber.Location = new System.Drawing.Point(448, 128);
            this.textBoxCardNumber.Name = "textBoxCardNumber";
            this.textBoxCardNumber.Size = new System.Drawing.Size(112, 20);
            this.textBoxCardNumber.TabIndex = 9;
            // 
            // lblClientId
            // 
            this.lblClientId.AutoSize = true;
            this.lblClientId.Location = new System.Drawing.Point(382, 53);
            this.lblClientId.Name = "lblClientId";
            this.lblClientId.Size = new System.Drawing.Size(51, 13);
            this.lblClientId.TabIndex = 10;
            this.lblClientId.Text = "Id Cliente";
            // 
            // textBoxClientId
            // 
            this.textBoxClientId.Location = new System.Drawing.Point(448, 50);
            this.textBoxClientId.Name = "textBoxClientId";
            this.textBoxClientId.Size = new System.Drawing.Size(112, 20);
            this.textBoxClientId.TabIndex = 11;
            // 
            // dgvChargeDetail
            // 
            this.dgvChargeDetail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvChargeDetail.Location = new System.Drawing.Point(26, 200);
            this.dgvChargeDetail.Name = "dgvChargeDetail";
            this.dgvChargeDetail.Size = new System.Drawing.Size(564, 150);
            this.dgvChargeDetail.TabIndex = 12;
            // 
            // buttonCharge
            // 
            this.buttonCharge.Location = new System.Drawing.Point(126, 415);
            this.buttonCharge.Name = "buttonCharge";
            this.buttonCharge.Size = new System.Drawing.Size(75, 23);
            this.buttonCharge.TabIndex = 13;
            this.buttonCharge.Text = "Facturar";
            this.buttonCharge.UseVisualStyleBackColor = true;
            this.buttonCharge.Click += new System.EventHandler(this.buttonCharge_Click);
            // 
            // lblTotal
            // 
            this.lblTotal.AutoSize = true;
            this.lblTotal.Location = new System.Drawing.Point(157, 370);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(90, 13);
            this.lblTotal.TabIndex = 14;
            this.lblTotal.Text = "Total Facturacion";
            // 
            // textBoxTotalCharge
            // 
            this.textBoxTotalCharge.Location = new System.Drawing.Point(275, 367);
            this.textBoxTotalCharge.Name = "textBoxTotalCharge";
            this.textBoxTotalCharge.Size = new System.Drawing.Size(100, 20);
            this.textBoxTotalCharge.TabIndex = 15;
            // 
            // buttonCancel
            // 
            this.buttonCancel.Location = new System.Drawing.Point(385, 415);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(75, 23);
            this.buttonCancel.TabIndex = 16;
            this.buttonCancel.Text = "Cancelar";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // FormFacturarPublicacionesDetail
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(639, 496);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.textBoxTotalCharge);
            this.Controls.Add(this.lblTotal);
            this.Controls.Add(this.buttonCharge);
            this.Controls.Add(this.dgvChargeDetail);
            this.Controls.Add(this.textBoxClientId);
            this.Controls.Add(this.lblClientId);
            this.Controls.Add(this.textBoxCardNumber);
            this.Controls.Add(this.lblCardNumber);
            this.Controls.Add(this.comboBoxTypePay);
            this.Controls.Add(this.lblTypePay);
            this.Controls.Add(this.textBoxLastName);
            this.Controls.Add(this.lblLastName);
            this.Controls.Add(this.textBoxName);
            this.Controls.Add(this.lblName);
            this.Controls.Add(this.textBoxStayId);
            this.Controls.Add(this.lblStayId);
            this.Name = "FormFacturarPublicacionesDetail";
            this.Text = "Detalle Facturar Estadia";
            this.Load += new System.EventHandler(this.FormFacturarPublicacionesDetail_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvChargeDetail)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblStayId;
        private System.Windows.Forms.TextBox textBoxStayId;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label lblLastName;
        private System.Windows.Forms.TextBox textBoxLastName;
        private System.Windows.Forms.Label lblTypePay;
        private System.Windows.Forms.ComboBox comboBoxTypePay;
        private System.Windows.Forms.Label lblCardNumber;
        private System.Windows.Forms.TextBox textBoxCardNumber;
        private System.Windows.Forms.Label lblClientId;
        private System.Windows.Forms.TextBox textBoxClientId;
        private System.Windows.Forms.DataGridView dgvChargeDetail;
        private System.Windows.Forms.Button buttonCharge;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.TextBox textBoxTotalCharge;
        private System.Windows.Forms.Button buttonCancel;
    }
}