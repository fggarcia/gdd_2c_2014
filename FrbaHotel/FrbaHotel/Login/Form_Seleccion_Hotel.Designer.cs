namespace FrbaHotel.Login
{
    partial class Form_Seleccion_Hotel
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
            this.dataGrid_Hotel = new System.Windows.Forms.DataGridView();
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid_Hotel)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGrid_Hotel
            // 
            this.dataGrid_Hotel.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGrid_Hotel.Location = new System.Drawing.Point(69, 37);
            this.dataGrid_Hotel.Name = "dataGrid_Hotel";
            this.dataGrid_Hotel.Size = new System.Drawing.Size(103, 105);
            this.dataGrid_Hotel.TabIndex = 6;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(87, 148);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(65, 31);
            this.button1.TabIndex = 5;
            this.button1.Text = "Aceptar";
            this.button1.UseVisualStyleBackColor = true;
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
            // Form_Seleccion_Hotel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(245, 202);
            this.Controls.Add(this.dataGrid_Hotel);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label1);
            this.Name = "Form_Seleccion_Hotel";
            this.Text = "Seleccion de Hotel";
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid_Hotel)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGrid_Hotel;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label1;
    }
}