using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Hotel
{
    public partial class FormABMHotelModify : Form
    {
        private Int32 hotelId;
        private Boolean edit;

        public FormABMHotelModify(Boolean edit, String hotelId)
        {
            InitializeComponent();
            if (hotelId != String.Empty)
                this.hotelId = Convert.ToInt32(hotelId);
            else
                this.hotelId = 0;
            this.edit = edit;
        }

        private void FormABMHotelModify_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            reloadGrid();
            Star.fillComboBox(comboBoxStar);

            if (edit)
            {
                Hotel hotelData = HotelHelper.getHotelData(hotelId);

                this.textBoxName.Text = hotelData.name;
                this.textBoxMail.Text = hotelData.mail;
                this.textBoxTelephone.Text = hotelData.telephone;
                this.textBoxAddress.Text = hotelData.address;
                this.textBoxAddressNumber.Text = hotelData.addressNumber.ToString();
                this.textBoxCity.Text = hotelData.city;
                this.textBoxCountry.Text = hotelData.country;
                this.dtCreation.Value = hotelData.creation;
                this.comboBoxStar.SelectedIndex = this.comboBoxStar.FindStringExact(hotelData.star.ToString());
                this.buttonSave.Text = "Editar hotel";
            }
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.closeWindow();
        }

        private void closeWindow()
        {
            FormABMHotel formABMHotel = new FormABMHotel();
            formABMHotel.MdiParent = this.MdiParent;
            MdiParent.Size = formABMHotel.Size;
            this.Close();
            formABMHotel.Show();
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            Hotel hotelData = this.getDataFromForm();
            if (hotelData != null)
            {
                this.saveOrUpdate(hotelData);
            }
        }

        private Hotel getDataFromForm()
        {
            Hotel hotelData = new Hotel();

            hotelData.id = hotelId;

            Boolean isValid;
            isValid = Validaciones.requiredString(textBoxName.Text, "El nombre es necesario");
            if (isValid)
                hotelData.name = textBoxName.Text;
            else
                return null;

            isValid = Validaciones.validAndRequiredMail(textBoxMail.Text, "El mail debe ser valido");
            if (isValid)
                hotelData.mail = textBoxMail.Text;
            else
                return null;

            isValid = Validaciones.requiredString(textBoxTelephone.Text, "El telefono es necesario");
            if (isValid)
                hotelData.telephone = textBoxTelephone.Text;
            else
                return null;

            isValid = Validaciones.requiredString(textBoxCity.Text, "La ciudad es necesaria");
            if (isValid)
                hotelData.city = textBoxCity.Text;
            else
                return null;

            isValid = Validaciones.requiredString(textBoxCountry.Text, "El pais es necesario");
            if (isValid)
                hotelData.country = textBoxCountry.Text;
            else
                return null;

            isValid = Validaciones.requiredString(textBoxAddress.Text, "La direccion es necesaria");
            if (isValid)
                hotelData.address = textBoxAddress.Text;
            else
                return null;

            isValid = Validaciones.validAndRequiredInt32MoreThan0(textBoxAddressNumber.Text, "El numero de la direccion debe ser numerico y mayor a cero");
            if (isValid)
                hotelData.addressNumber = Convert.ToInt32(textBoxAddressNumber.Text);
            else
                return null;

            isValid = Validaciones.requiredString(comboBoxStar.Text.ToString(), "La cantidad de estrellas de documento es necesario");
            if (isValid)
                hotelData.star = Convert.ToInt32(comboBoxStar.SelectedValue.ToString());
            else
                return null;

            DateTime creation = dtCreation.Value;

            DateHelper.truncate(creation);
            hotelData.creation = creation;

            return hotelData;
        }

        private void saveOrUpdate(Hotel hotelData)
        {
            HotelHelper.save(hotelData);
            if (edit)
            {
                MessageBox.Show("Modificacion de hotel realizada con exito");
            }
            else
            {
                MessageBox.Show("Creacion de hotel realizada con exito");
            }
            this.closeWindow();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            if (hotelId != 0)
            {
                if (dgvToAdd.CurrentRow != null)
                {
                    Int32 idRegimen = Convert.ToInt32(dgvToAdd.CurrentRow.Cells[0].Value);
                    RegimenHotelHelper.setRegimenToHotel(hotelId, idRegimen);
                    MessageBox.Show("Se agrego regimen al hotel correctamente");
                    reloadGrid();
                }
                else
                {
                    MessageBox.Show("Debe seleccionar una regimen a agregar al hotel");
                }
            }
            else
            {
                MessageBox.Show("Debe primero guardar primero la informacion del hotel");
            }

        }

        private void buttonRemove_Click(object sender, EventArgs e)
        {
            if (hotelId != 0)
            {
                if (dgvSelected.CurrentRow != null)
                {
                    Int32 idRegimen = Convert.ToInt32(dgvSelected.CurrentRow.Cells[0].Value);
                    Boolean ok = RegimenHotelHelper.removeRegimenToHotel(hotelId, idRegimen);
                    if (ok)
                    {
                        MessageBox.Show("Se quito regimen al hotel correctamente");
                    }
                    else
                    {
                        MessageBox.Show("No se pudo eliminar el hotel, ya que debe existir una reserva con ese regimen proximamente", "",
                            MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    
                    reloadGrid();
                }
                else
                {
                    MessageBox.Show("Debe seleccionar un regimen a remover al hotel");
                }
            }
            else
            {
                MessageBox.Show("Debe primero guardar la informacion del hotel");
            }
        }

        private void reloadGrid()
        {
            RegimenHotelHelper.getRegimenHotelAvailable(hotelId, this.dgvToAdd);
            RegimenHotelHelper.getRegimenHotelAssign(hotelId, this.dgvSelected);
        }
    }
}
