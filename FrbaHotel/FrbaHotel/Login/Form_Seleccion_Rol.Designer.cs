namespace FrbaHotel.Login
{
    partial class Form_Seleccion_Rol
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
            this.button1 = new System.Windows.Forms.Button();
            this.dataGrid_Rol = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid_Rol)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(175, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Seleccione el Rol que desea utilizar";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(75, 136);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(65, 31);
            this.button1.TabIndex = 2;
            this.button1.Text = "Aceptar";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // dataGrid_Rol
            // 
            this.dataGrid_Rol.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGrid_Rol.Location = new System.Drawing.Point(57, 25);
            this.dataGrid_Rol.Name = "dataGrid_Rol";
            this.dataGrid_Rol.Size = new System.Drawing.Size(103, 105);
            this.dataGrid_Rol.TabIndex = 3;
            // 
            // Form_Seleccion_Rol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(220, 200);
            this.Controls.Add(this.dataGrid_Rol);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label1);
            this.Name = "Form_Seleccion_Rol";
            this.Text = "Seleccion de Rol";
            //this.Load += new System.EventHandler(this.Form_Seleccion_Rol_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid_Rol)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridView dataGrid_Rol;
    }
}