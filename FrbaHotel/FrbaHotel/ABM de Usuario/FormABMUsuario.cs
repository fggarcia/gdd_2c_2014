using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Hotel;
using FrbaHotel.ABM_de_Rol;

namespace FrbaHotel.ABM_de_Usuario
{
    public partial class FormABMUsuario : Form
    {
        public FormABMUsuario()
        {
            InitializeComponent();
        }

        private void FormABMUsuario_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            Hoteles.fillComboBox(comboBoxHotel);
            Roles.fillComboBox(comboBoxRol);
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            TextBoxHelper.clean(textBoxName);
            ComboBoxHelper.clean(comboBoxHotel);
            ComboBoxHelper.clean(comboBoxRol);
            DataGridViewHelper.clean(dgvUser);
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            UsuarioHelper.search(textBoxName.Text, comboBoxRol.SelectedValue.ToString(), comboBoxHotel.Text, dgvUser);
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonDisable_Click(object sender, EventArgs e)
        {
            if (dgvUser.CurrentRow != null)
            {
                UsuarioHelper.enable(Convert.ToString(dgvUser.CurrentRow.Cells[0].Value), false);
                buttonSearch.PerformClick();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un usuario a deshabilitar");
            }
        }

        private void buttonEnable_Click(object sender, EventArgs e)
        {
            if (dgvUser.CurrentRow != null)
            {
                UsuarioHelper.enable(Convert.ToString(dgvUser.CurrentRow.Cells[0].Value), true);
                buttonSearch.PerformClick();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un usuario a habilitar");
            }
        }
    }
}
