using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Facturar_Publicaciones
{
    public partial class FormFacturarPublicaciones : Form
    {
        public FormFacturarPublicaciones()
        {
            InitializeComponent();
        }

        private void FormFacturarPublicaciones_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            if (textBoxBooking.Text == String.Empty)
            {
                MessageBox.Show("Debe ingresar un numero de reserva a facturar");
                return;
            }

            Int32 bookingId = Convert.ToInt32(textBoxBooking.Text);
            ChargeStayHelper.search(bookingId, dgvStay);

            buttonCharge.Enabled = false;
            if (dgvStay.RowCount < 1)
            {
                StayStatus status = ChargeStayHelper.getStatus(bookingId);
                showMessage(status);
            }
            else
            {
                buttonCharge.Enabled = true;
            }
        }

        private void showMessage(StayStatus status)
        {
            if (!status.isExist)
            {
                MessageBox.Show("No existe estadia para la reserva", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (!status.isHotel)
            {
                MessageBox.Show("La estadia de la reserva no pertenece a este hotel", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (status.isCheckIn)
            {
                MessageBox.Show("La estadia de la reserva solo tiene checkin", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (status.wasCharged)
            {
                MessageBox.Show("La estadia de la reserva ya fue facturada", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonCharge_Click(object sender, EventArgs e)
        {
            if (dgvStay.CurrentRow != null){
                Int32 stayId = Convert.ToInt32(dgvStay.CurrentRow.Cells[1].Value);
                Int32 clientId = Convert.ToInt32(dgvStay.CurrentRow.Cells[5].Value);
                String name = dgvStay.CurrentRow.Cells[6].Value.ToString();
                String lastName = dgvStay.CurrentRow.Cells[7].Value.ToString();
                FormFacturarPublicacionesDetail formFacturarPublicacionesDetail = new FormFacturarPublicacionesDetail(stayId, clientId, name, lastName);
                formFacturarPublicacionesDetail.MdiParent = this.MdiParent;
                MdiParent.Size = formFacturarPublicacionesDetail.Size;
                formFacturarPublicacionesDetail.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Debe seleccionar una estadia a facturar");
            } 
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
