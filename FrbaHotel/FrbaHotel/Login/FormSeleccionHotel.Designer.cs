namespace FrbaHotel.Login
{
    partial class FormSeleccionHotel
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
            this.button_accept = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox_hotel = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // button_accept
            // 
            this.button_accept.Location = new System.Drawing.Point(89, 100);
            this.button_accept.Name = "button_accept";
            this.button_accept.Size = new System.Drawing.Size(65, 31);
            this.button_accept.TabIndex = 5;
            this.button_accept.Text = "Aceptar";
            this.button_accept.UseVisualStyleBackColor = true;
            this.button_accept.Click += new System.EventHandler(this.button_accept_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(230, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Seleccione el Hotel sobre el cual desea operar:";
            // 
            // comboBox_hotel
            // 
            this.comboBox_hotel.FormattingEnabled = true;
            this.comboBox_hotel.Location = new System.Drawing.Point(49, 53);
            this.comboBox_hotel.Name = "comboBox_hotel";
            this.comboBox_hotel.Size = new System.Drawing.Size(162, 21);
            this.comboBox_hotel.TabIndex = 6;
            // 
            // FormSeleccionHotel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(245, 156);
            this.Controls.Add(this.comboBox_hotel);
            this.Controls.Add(this.button_accept);
            this.Controls.Add(this.label1);
            this.Name = "FormSeleccionHotel";
            this.Text = "Seleccion de Hotel";
            this.Load += new System.EventHandler(this.FormSeleccionHotel_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button_accept;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox_hotel;
    }
}