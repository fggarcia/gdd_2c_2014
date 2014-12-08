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

            if (dgvBooking.RowCount < 1)
            {
                BookingStatus status = RegisterStayHelper.bookingStatus(bookingId);
                showMessageError(status);
            }
        }

        private void showMessageError(BookingStatus status)
        {

        }
    }
}
