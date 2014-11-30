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
    public partial class FormABMHotel : Form
    {
        public FormABMHotel()
        {
            InitializeComponent();
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            TextBoxHelper.clean(this);
            DataGridViewHelper.clean(dgvHotel);
            Star.fillComboBox(comboBoxStar);
        }

        private void FormABMHotel_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            TextBoxHelper.clean(this);
            DataGridViewHelper.clean(dgvHotel);
            Star.fillComboBox(comboBoxStar);
        }

        private void buttonEnable_Click(object sender, EventArgs e)
        {
            if (dgvHotel.CurrentRow != null)
            {
                HotelHelper.enable(Convert.ToInt32(dgvHotel.CurrentRow.Cells[0].Value), true);
                buttonSearch.PerformClick();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un hotel a habilitar");
            }
        }

        private void buttonDisable_Click(object sender, EventArgs e)
        {
            if (dgvHotel.CurrentRow != null)
            {
                HotelHelper.enable(Convert.ToInt32(dgvHotel.CurrentRow.Cells[0].Value), false);
                buttonSearch.PerformClick();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un hotel a deshabilitar");
            }
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            Hotel hotel = this.getDataToSearch();
            HotelHelper.search(hotel, dgvHotel);
        }

        private Hotel getDataToSearch()
        {
            Hotel hotel = new Hotel();

            hotel.name = textBoxName.Text;

            if (comboBoxStar.SelectedValue.ToString() != String.Empty)
                hotel.star = Convert.ToInt32(comboBoxStar.SelectedValue.ToString());
            else
                hotel.star = 0;

            hotel.city = textBoxCity.Text;
            hotel.country = textBoxCountry.Text;
            
            return hotel;
        }

        private void buttonCreate_Click(object sender, EventArgs e)
        {
            FormABMHotelModify formABMHotelModify = new FormABMHotelModify(false, null);
            formABMHotelModify.MdiParent = this.MdiParent;
            MdiParent.Size = formABMHotelModify.Size;
            formABMHotelModify.Show();
            this.Close();
        }

        private void buttonModify_Click(object sender, EventArgs e)
        {
            if (dgvHotel.CurrentRow != null)
            {
                FormABMHotelModify formABMHotelModify = new FormABMHotelModify(true, dgvHotel.CurrentRow.Cells[0].Value.ToString());
                formABMHotelModify.MdiParent = this.MdiParent;
                MdiParent.Size = formABMHotelModify.Size;
                formABMHotelModify.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un hotel a modificar");
            }
        }

        private void buttonDisablePeriod_Click(object sender, EventArgs e)
        {
            if (dgvHotel.CurrentRow != null)
            {
                FormABMHotelPeriod formABMHotelPeriod = new FormABMHotelPeriod(Convert.ToInt32(dgvHotel.CurrentRow.Cells[0].Value.ToString()));
                formABMHotelPeriod.MdiParent = this.MdiParent;
                MdiParent.Size = formABMHotelPeriod.Size;
                formABMHotelPeriod.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un hotel a generar un periodo de cerrado");
            }
        }
    }
}
