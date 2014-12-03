using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Cancelar_Reserva
{
    public partial class FormCancelarReserva : Form
    {
        public FormCancelarReserva()
        {
            InitializeComponent();
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            Boolean isValid = true;
            if (VarGlobal.usuario.hotel == 0)
            {
                isValid = Validaciones.validAndRequiredInt32(textBoxBookingId.Text, "El numero de reserva debe ser numerico");
            }

            if (isValid)
            {
                Int32 bookingId;
                if (textBoxBookingId.Text != String.Empty)
                    bookingId = Convert.ToInt32(textBoxBookingId.Text);
                else
                    bookingId = 0;
                CancelationBookingHelper.search(bookingId, textBoxLastname.Text, dgvCancellationBooking);
            }
            else
            {
                return;
            }
        }

        private void FormCancelarReserva_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            TextBoxHelper.clean(this);
            DataGridViewHelper.clean(dgvCancellationBooking);
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            TextBoxHelper.clean(this);
            DataGridViewHelper.clean(dgvCancellationBooking);
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            if (dgvCancellationBooking.CurrentRow != null)
            {
                if (textBoxMotive.Text != String.Empty)
                {
                    CancelationBookingHelper.cancel(Convert.ToInt32(dgvCancellationBooking.CurrentRow.Cells[0].Value), textBoxMotive.Text);
                    buttonSearch.PerformClick();
                }
                else
                {
                    MessageBox.Show("Debe escribir un motivo para la cancelacion de la reserva");
                }
                
            }
            else
            {
                MessageBox.Show("Debe seleccionar una reserva a cancelar");
            }
        }
    }
}
