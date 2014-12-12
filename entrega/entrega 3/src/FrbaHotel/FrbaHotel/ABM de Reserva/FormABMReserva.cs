using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;


namespace FrbaHotel.ABM_de_Reserva
{
    public partial class FormABMReserva : Form
    {
        public FormABMReserva()
        {
            InitializeComponent();
        }

        private void FormABMReserva_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
            Reserva reserva = this.getDataToSearch();
            ReservaHelper.search(reserva, dgvReserva);
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonCreate_Click(object sender, EventArgs e)
        {
            FormAltaReserva formAltaReserva = new FormAltaReserva();
            formAltaReserva.MdiParent = this.MdiParent;
            MdiParent.Size = formAltaReserva.Size;
            formAltaReserva.Show();
            this.Close();
        }

        private Reserva getDataToSearch()
        {
            Reserva reserva = new Reserva();

                reserva.nombre = txtNombre.Text;
                reserva.apellido = txtApellido.Text;
                if (TxtNroReserva.Text!=String.Empty)
                    reserva.id = int.Parse(TxtNroReserva.Text); 
                reserva.id_hotel = VarGlobal.usuario.hotel;
            

            return reserva;
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            Reserva reserva = this.getDataToSearch();
            ReservaHelper.search(reserva, dgvReserva);
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            Reserva reserva = this.getDataToSearch();
            ReservaHelper.search(reserva, dgvReserva);
        }

        private void buttonModify_Click(object sender, EventArgs e)
        {
            FormModificacionReserva formModificacionReserva = new FormModificacionReserva();
            formModificacionReserva.MdiParent = this.MdiParent;
            MdiParent.Size = formModificacionReserva.Size;
            formModificacionReserva.Show();
            this.Close();
        }

   }
}
