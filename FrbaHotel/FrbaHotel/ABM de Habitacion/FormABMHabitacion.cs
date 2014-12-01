using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Habitacion
{
    public partial class FormABMHabitacion : Form
    {
        public FormABMHabitacion()
        {
            InitializeComponent();
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            DataGridViewHelper.clean(dgvRoom);
            TextBoxHelper.clean(this);
            Front.fillComboBox(comboBoxFront);
            TypeRoom.fillComboBox(comboBoxType);
            HotelUserHelper.fillComboBox(comboBoxHotel);
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            Habitacion room = this.getDataToSearch();
            HabitacionHelper.search(room, dgvRoom);
        }

        private Habitacion getDataToSearch()
        {
            Habitacion room = new Habitacion();

            if (comboBoxHotel.SelectedValue.ToString() != String.Empty)
            {
                room.hotel = Convert.ToInt32(comboBoxHotel.SelectedValue.ToString());
            }
            else
            {
                room.hotel = 0;
            }

            if (textBoxRoom.Text != String.Empty)
            {
                Boolean isValid;
                isValid = Validaciones.validAndRequiredInt32MoreThan0(textBoxRoom.Text, "El numeo de habitacion debe ser numerico");
                if (isValid)
                    room.id = Convert.ToInt32(textBoxRoom.Text);
                else
                    room.id = 0;
            }
            else
            {
                room.id = 0;
            }

            if (textBoxFloor.Text != String.Empty)
            {
                Boolean isValid;
                isValid = Validaciones.validAndRequiredInt32MoreThan0(textBoxFloor.Text, "El numeo de piso debe ser numerico");
                if (isValid)
                    room.floor = Convert.ToInt32(textBoxFloor.Text);
                else
                    room.floor = 0;
            }
            else
            {
                room.floor = 0;
            }

            if (comboBoxFront.SelectedValue.ToString() != String.Empty)
            {
                room.front = Convert.ToInt32(comboBoxFront.SelectedValue.ToString());
            }else
            {
                room.front = 0;
            }

            if (comboBoxType.SelectedValue.ToString() != String.Empty)
            {
                room.type = Convert.ToInt32(comboBoxType.SelectedValue.ToString());
            }
            else
            {
                room.type = 0;
            }

            room.comodity = textBoxDescription.Text;

            return room;
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void FormABMHabitacion_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            TextBoxHelper.clean(this);
            DataGridViewHelper.clean(dgvRoom);
            Front.fillComboBox(comboBoxFront);
            TypeRoom.fillComboBox(comboBoxType);
            HotelUserHelper.fillComboBox(comboBoxHotel);

        }


    }
}
