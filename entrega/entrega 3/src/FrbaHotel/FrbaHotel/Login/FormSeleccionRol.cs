using System.Windows.Forms;
using System;
using System.Data.SqlClient;
using System.Data;
using FrbaHotel.ABM_de_Rol;

namespace FrbaHotel.Login
{
    public partial class FormSeleccionRol : Form
    {
        private int countRol;

        public FormSeleccionRol()
        {
            InitializeComponent();

            Usuario user = VarGlobal.usuario;

            countRol = Roles.fillRolByUser(user);
            
            if (countRol > 0)
            {
                Roles.fillComboBoxByUser(comboBox_Roles, user);
            }
            else
            {
                MessageBox.Show("El usuario no tiene ningun rol habilitado");
            }
        }

        private void button_accept_Click(object sender, EventArgs e)
        {
            Usuario user = VarGlobal.usuario;

            if (comboBox_Roles.Text != "")
            {
                string rolDescription = comboBox_Roles.Text;
                int idRol = Convert.ToInt16(comboBox_Roles.SelectedValue.ToString());

                user.rol = new Rol(idRol, rolDescription);

                goToSeleccionHotel();
            }
            else 
            {
                MessageBox.Show("Debe ser seleccionar un tipo de rol");
            }
        }

        private void goToSeleccionHotel()
        {
            FormSeleccionHotel formSeleccionHotel = new FormSeleccionHotel();
            this.Hide();
            formSeleccionHotel.ShowDialog();
            this.Close();
        }

        private void FormSeleccionRol_Load(object sender, EventArgs e)
        {
            if (countRol == 1)
            {
                goToSeleccionHotel();
            }
        }
    }
}
