using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Common;
using System.Data.SqlClient;
using FrbaHotel.Hotel;

namespace FrbaHotel.Login
{
    public partial class FormSeleccionHotel : Form
    {
        private int countHotel;

        public FormSeleccionHotel()
        {
            InitializeComponent();

            Usuario user = VarGlobal.usuario;

            countHotel = Hoteles.fillHotelByUser(user);

            if (countHotel > 0)
            {
                Hoteles.fillComboBoxByUser(comboBox_hotel, user);
            }
            else
            {
                MessageBox.Show("El usuario no tiene ningun hotel habilitado");
            }
        }

        private void button_accept_Click(object sender, EventArgs e)
        {
            Usuario user = VarGlobal.usuario;

            if (comboBox_hotel.Text != "")
            {
                string rolDescription = comboBox_hotel.Text;
                int idHotel = Convert.ToInt16(comboBox_hotel.SelectedValue.ToString());

                user.hotel = idHotel;

                goToMenu();
            }
            else
            {
                MessageBox.Show("Debe ser seleccionar un tipo de rol");
            }
        }

        private void goToMenu()
        {
            FormMenu formMenu = new FormMenu();
            this.Hide();
            formMenu.ShowDialog();
            this.Close();
        }

        private void FormSeleccionHotel_Load(object sender, EventArgs e)
        {
            if (countHotel == 1)
            {
                goToMenu();
            }
        }


    }
}
