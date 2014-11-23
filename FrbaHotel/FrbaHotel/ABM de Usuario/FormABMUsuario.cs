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
    }
}
