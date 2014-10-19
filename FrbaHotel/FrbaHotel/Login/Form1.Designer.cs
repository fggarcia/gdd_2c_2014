namespace FrbaHotel.Login
{
    partial class Form_Login
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
            this.textBox_usuario = new System.Windows.Forms.TextBox();
            this.lbl_usuario = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label_Title = new System.Windows.Forms.Label();
            this.button_Login = new System.Windows.Forms.Button();
            this.button_salir = new System.Windows.Forms.Button();
            this.button_LoginHuesped = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textBox_usuario
            // 
            this.textBox_usuario.Location = new System.Drawing.Point(117, 56);
            this.textBox_usuario.Name = "textBox_usuario";
            this.textBox_usuario.Size = new System.Drawing.Size(100, 20);
            this.textBox_usuario.TabIndex = 0;
            // 
            // lbl_usuario
            // 
            this.lbl_usuario.AutoSize = true;
            this.lbl_usuario.Location = new System.Drawing.Point(50, 59);
            this.lbl_usuario.Name = "lbl_usuario";
            this.lbl_usuario.Size = new System.Drawing.Size(43, 13);
            this.lbl_usuario.TabIndex = 1;
            this.lbl_usuario.Text = "Usuario";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(50, 85);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Contraseña";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(117, 82);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 2;
            // 
            // label_Title
            // 
            this.label_Title.AutoSize = true;
            this.label_Title.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label_Title.Location = new System.Drawing.Point(11, 9);
            this.label_Title.Name = "label_Title";
            this.label_Title.Size = new System.Drawing.Size(248, 24);
            this.label_Title.TabIndex = 4;
            this.label_Title.Text = "Sistema de Gestion Hotelera";
            // 
            // button_Login
            // 
            this.button_Login.Location = new System.Drawing.Point(15, 131);
            this.button_Login.Name = "button_Login";
            this.button_Login.Size = new System.Drawing.Size(75, 23);
            this.button_Login.TabIndex = 5;
            this.button_Login.Text = "Login";
            this.button_Login.UseVisualStyleBackColor = true;
            // 
            // button_salir
            // 
            this.button_salir.Location = new System.Drawing.Point(166, 131);
            this.button_salir.Name = "button_salir";
            this.button_salir.Size = new System.Drawing.Size(75, 23);
            this.button_salir.TabIndex = 6;
            this.button_salir.Text = "Salir";
            this.button_salir.UseVisualStyleBackColor = true;
            this.button_salir.Click += new System.EventHandler(this.button_salir_Click);
            // 
            // button_LoginHuesped
            // 
            this.button_LoginHuesped.Location = new System.Drawing.Point(63, 176);
            this.button_LoginHuesped.Name = "button_LoginHuesped";
            this.button_LoginHuesped.Size = new System.Drawing.Size(129, 23);
            this.button_LoginHuesped.TabIndex = 7;
            this.button_LoginHuesped.Text = "Login de Huespedes";
            this.button_LoginHuesped.UseVisualStyleBackColor = true;
            // 
            // Form_Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(265, 218);
            this.Controls.Add(this.button_LoginHuesped);
            this.Controls.Add(this.button_salir);
            this.Controls.Add(this.button_Login);
            this.Controls.Add(this.label_Title);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.lbl_usuario);
            this.Controls.Add(this.textBox_usuario);
            this.Name = "Form_Login";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form_Login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox_usuario;
        private System.Windows.Forms.Label lbl_usuario;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label_Title;
        private System.Windows.Forms.Button button_Login;
        private System.Windows.Forms.Button button_salir;
        private System.Windows.Forms.Button button_LoginHuesped;
    }
}