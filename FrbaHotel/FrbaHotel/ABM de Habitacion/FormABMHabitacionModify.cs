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
    public partial class FormABMHabitacionModify : Form
    {
        private Int32 roomId;
        private Int32 hotelId;
        private Int32 floorId;
        private Boolean edit;

        public FormABMHabitacionModify(Boolean edit, String hotelId, String floorId, String roomId)
        {
            InitializeComponent();
            if (roomId != String.Empty)
                this.roomId = Convert.ToInt32(roomId);
            else
                this.roomId = 0;
            if (hotelId != String.Empty)
                this.hotelId = Convert.ToInt32(hotelId);
            else
                this.hotelId = 0;
            if (floorId != String.Empty)
                this.floorId = Convert.ToInt32(floorId);
            else
                this.floorId = 0;
            this.edit = edit;
        }

        private void FormABMHabitacionModify_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            Front.fillComboBox(comboBoxFront);
            TypeRoom.fillComboBox(comboBoxType);
            HotelUserHelper.fillComboBox(comboBoxHotel);

            if (edit)
            {
                Habitacion room = HabitacionHelper.getRoomData(hotelId, floorId, roomId);
                this.textBoxRoom.Text = room.id.ToString();
                this.textBoxRoom.Enabled = false;
                this.textBoxFloor.Text = room.floor.ToString();
                this.textBoxFloor.Enabled = false;
                this.comboBoxHotel.SelectedIndex = this.comboBoxHotel.FindStringExact(room.hotelName.ToString());
                this.comboBoxHotel.Enabled = false;
                this.comboBoxType.SelectedIndex = this.comboBoxType.FindStringExact(room.typeDescription);
                this.comboBoxFront.SelectedIndex = this.comboBoxFront.FindStringExact(room.frontDescription);
                this.textBoxComodity.Text = room.comodity;
            }
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.closeWindow();
        }

        private void closeWindow()
        {
            FormABMHabitacion formABMHabitacion = new FormABMHabitacion();
            formABMHabitacion.MdiParent = this.MdiParent;
            MdiParent.Size = formABMHabitacion.Size;
            this.Close();
            formABMHabitacion.Show();
        }

        private void saveOrUpdate(Habitacion roomData)
        {
            if (!edit)
            {
                if (HabitacionHelper.existHotelRoom(roomData.hotel, roomData.floor, roomData.id))
                {
                    MessageBox.Show("Ya existe una habitacion para ese hotel con ese piso", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }
            HabitacionHelper.save(roomData);
            if (edit)
            {
                MessageBox.Show("Modificacion de habitacion realizada con exito");
            }
            else
            {
                MessageBox.Show("Creacion de habitacion realizada con exito");
            }
            this.closeWindow();
        }

        private void buttonAccept_Click(object sender, EventArgs e)
        {
            Habitacion roomData = this.getDataFromForm();
            if (roomData != null)
            {
                this.saveOrUpdate(roomData);
            }
        }

        private Habitacion getDataFromForm()
        {
            Habitacion room = new Habitacion();

            Boolean isValid;
            isValid = Validaciones.validAndRequiredInt32MoreThanEqual0(textBoxFloor.Text, "El piso debe ser numerico mayor o igual a 0");
            if (isValid)
                room.floor = Convert.ToInt32(textBoxFloor.Text);
            else
                return null;

            isValid = Validaciones.validAndRequiredInt32MoreThanEqual0(textBoxRoom.Text, "El hotel debe ser numerico mayor o igual a 0");
            if (isValid)
                room.id = Convert.ToInt32(textBoxRoom.Text);
            else
                return null;

            isValid = Validaciones.requiredString(comboBoxHotel.SelectedValue.ToString(), "Debe seleccionar un hotel");
            if (isValid){
                room.hotel = Convert.ToInt32(comboBoxHotel.SelectedValue.ToString());
                room.hotelName = comboBoxHotel.SelectedText;
            }
            else
                return null;

            isValid = Validaciones.requiredString(comboBoxType.SelectedValue.ToString(), "Debe seleccionar un tipo de habitacion");
            if (isValid)
            {
                room.type = Convert.ToInt32(comboBoxType.SelectedValue.ToString());
                room.typeDescription = comboBoxType.SelectedText;
            }
            else
                return null;

            isValid = Validaciones.requiredString(comboBoxFront.SelectedValue.ToString(), "Debe seleccionar el frente");
            if (isValid)
            {
                room.front = Convert.ToInt32(comboBoxFront.SelectedValue.ToString());
                room.frontDescription = comboBoxFront.SelectedText;
            }
            else
                return null;

            isValid = Validaciones.requiredString(textBoxComodity.Text, "Debe agregar comodidades a la habitacion");
            if (isValid)
            {
                room.comodity = textBoxComodity.Text;
            }
            else
                return null;

            return room;
        }
    }
}
