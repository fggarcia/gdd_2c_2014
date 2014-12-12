using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Common;

namespace FrbaHotel.ABM_de_Hotel
{
    public partial class FormABMHotelPeriod : Form
    {
        private Int32 hotelId;
        public FormABMHotelPeriod(Int32 hotelId)
        {
            InitializeComponent();
            this.hotelId = hotelId;
        }

        private void buttonCancel_Click(object sender, EventArgs e)
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

        private void buttonAccept_Click(object sender, EventArgs e)
        {
            Period period = this.getDataFromForm();

            if (period != null)
            {
                Boolean addOk = HotelHelper.closePeriod(hotelId, period);
                if (addOk)
                {
                    MessageBox.Show("Se agrego correctamente periodo cerrado");
                    this.closeWindow();
                }
                else
                {
                    MessageBox.Show("Existen reserva o estadia para el momento elegido");
                }
            }            
        }

        private Period getDataFromForm()
        {
            Period period = new Period();

            DateTime from = dtFrom.Value;
            DateTime to = dtTo.Value;
            DateHelper.truncate(from);
            DateHelper.truncate(to);

            if (from > to)
            {
                MessageBox.Show("La fecha desde tiene que ser mayor a la de hasta", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }

            Boolean isValid = Validaciones.requiredString(textBoxMotive.Text, "Debe agregar un motivo para el periodo");
            if (isValid)
            {
                period.from = from;
                period.to = to;

                period.motive = textBoxMotive.Text;
            }
            else
            {
                return null;
            }

            return period;
        }
    }
}
