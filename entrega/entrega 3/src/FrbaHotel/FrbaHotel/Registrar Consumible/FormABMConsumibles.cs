using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Registrar_Consumible
{
    public partial class FormABMConsumibles : Form
    {
        private String idUser;
        private Int32 idHotel;

        public FormABMConsumibles()
        {
            InitializeComponent();
            this.idUser = VarGlobal.usuario.id;
            this.idHotel = VarGlobal.usuario.hotel;
        }

        private void FormABMConsumibles_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            Boolean isValid = Validaciones.validInt32(txtNroReserva.Text, "Debe ingresar un valor de reserva");

            if (isValid)
            {
                Int32 idReserva = Int32.Parse(txtNroReserva.Text);
                ConsumiblesHelper.search(this.idHotel, idReserva, dgvEstadias);

                if (dgvEstadias.RowCount == 0) {
                    MessageBox.Show(" No se han encontrado resultados para la reserva ", "",MessageBoxButtons.OK, MessageBoxIcon.Exclamation); 
                }

            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnClean_Click(object sender, EventArgs e)
        {
            TextBoxHelper.clean(this);
            DataGridViewHelper.clean(dgvEstadias);
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            if (dgvEstadias.CurrentRow != null)
            {
                Int32 idEstadia = Convert.ToInt32(dgvEstadias.CurrentRow.Cells[0].Value.ToString());
                FormRegistrarConsumibles formRegistrarConsumibles = new FormRegistrarConsumibles(idUser, idEstadia);
                formRegistrarConsumibles.MdiParent = this.MdiParent;
                MdiParent.Size = formRegistrarConsumibles.Size;
                formRegistrarConsumibles.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Debe seleccionar una estadia a modificar");
            }             
        }
    }
}
