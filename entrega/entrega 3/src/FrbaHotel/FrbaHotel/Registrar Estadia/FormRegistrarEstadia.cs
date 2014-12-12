using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Registrar_Estadia
{
    public partial class FormRegistrarEstadia : Form
    {
        public FormRegistrarEstadia()
        {
            InitializeComponent();
        }

        private void FormRegistrarEstadia_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            if (textBoxBookingId.Text == String.Empty)
            {
                MessageBox.Show("Debe ingresar un numero de reserva a registrar");
                return;
            }

            Int32 bookingId = Convert.ToInt32(textBoxBookingId.Text);
            RegisterStayHelper.search(bookingId, dgvBooking);

            buttonCheckIn.Enabled = false;
            buttonCheckOut.Enabled = false;
            if (dgvBooking.RowCount < 1)
            {
                BookingStatus status = RegisterStayHelper.bookingStatus(bookingId);
                showMessageError(status);
                Boolean isBookingMustBeCancelForNoPresentation = RegisterStayHelper.checkIsMustBeCancelled(bookingId);
                if (isBookingMustBeCancelForNoPresentation)
                    MessageBox.Show("Se cancelo la reserva por pasarse del tiempo del checkIn", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                Boolean existFullStay = RegisterStayHelper.existFullStay(bookingId);
                if (!existFullStay)
                {
                    Boolean forCheckIn = RegisterStayHelper.isForCheckIn(bookingId);
                    if (forCheckIn)
                    {
                        buttonCheckIn.Enabled = true;
                    }
                    else
                    {
                        buttonCheckOut.Enabled = true;
                    }
                }
                else
                {
                    MessageBox.Show("Ya existe un checkin y un checkout para esta reserva");
                }
            }
        }

        private void showMessageError(BookingStatus status)
        {
            if (!status.exist)
            {
                MessageBox.Show("La Reserva no existe", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            if (status.exist && ! status.hotel)
            {
                MessageBox.Show("La Reserva existe, pero no en este hotel", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            if (status.cancel)
            {
                MessageBox.Show("La Reserva tiene un estado cancelado", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            if (status.before && !status.cancel)
            {
                MessageBox.Show("La fecha de reserva todavia es superior al dia actual", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonCheckIn_Click(object sender, EventArgs e)
        {
            if (dgvBooking.CurrentRow != null)
            {
                Int32 bookingId = Convert.ToInt32(dgvBooking.CurrentRow.Cells[0].Value.ToString());
                Int32 clientId = Convert.ToInt32(dgvBooking.CurrentRow.Cells[1].Value.ToString());
                FormRegistrarEstadiaCliente formRegistrarEstadiaCliente = new FormRegistrarEstadiaCliente(bookingId, clientId);
                formRegistrarEstadiaCliente.MdiParent = this.MdiParent;
                MdiParent.Size = formRegistrarEstadiaCliente.Size;
                formRegistrarEstadiaCliente.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Debe seleccionar una reserva a registrar", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonCheckOut_Click(object sender, EventArgs e)
        {
            if (dgvBooking.CurrentRow != null)
            {
                Int32 bookingId = Convert.ToInt32(dgvBooking.CurrentRow.Cells[0].Value);
                RegisterStayHelper.checkout(bookingId);
                MessageBox.Show("Se genero el checkout de la reserva correctamente", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                TextBoxHelper.clean(this);
                DataGridViewHelper.clean(dgvBooking);
                this.buttonCheckOut.Enabled = false;
            }
            else
            {
                MessageBox.Show("Debe seleccionar un reserva para generarle el checkout", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
