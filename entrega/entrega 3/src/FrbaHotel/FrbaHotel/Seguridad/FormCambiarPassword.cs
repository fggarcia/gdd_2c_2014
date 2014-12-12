using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Seguridad
{
    public partial class FormCambiarPassword : Form
    {
        public FormCambiarPassword()
        {
            InitializeComponent();
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            if (textBoxOldPassword.Text == String.Empty)
            {
                MessageBox.Show("La contraseña anterior no puede ser vacia", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            if (textBoxNewPassword.Text == String.Empty)
            {
                MessageBox.Show("La contraseña nueva no puede ser vacia", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!PasswordHelper.isCorrectPassword(textBoxOldPassword.Text))
            {
                MessageBox.Show("La contraseña anterior no corresponde", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            if (textBoxNewPassword.Text != textBoxConfirmNewPassword.Text)
            {
                MessageBox.Show("La contraseña nueva y la confirmacion no coinciden", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            PasswordHelper.change(textBoxNewPassword.Text);
            MessageBox.Show("La contraseña fue modificada con exito", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            this.Close();
        }
    }
}
