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
    public partial class FormModificacionReserva : Form
    {
        public FormModificacionReserva()
        {
            InitializeComponent();
        }

        private void buttonVolver_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonBuscar_Click(object sender, EventArgs e)
        {
            ReservaHelper.search_regimen(VarGlobal.usuario.hotel, dgvRegimen);
            ReservaHelper.search_tipo_hab(VarGlobal.usuario.hotel, dgvTipoHabitacion);

            Reserva reserva = this.getDataToSearch();
            ReservaHelper.search_reserva(reserva);
            dtFechaDesde.Value = reserva.fecha_inicio;
            dtFechaHasta.Value = dtFechaDesde.Value.AddDays(reserva.estadia);

            for (int i = 0; i < dgvRegimen.RowCount; i++)
            {
                if (dgvRegimen.Rows[i].Cells[0].Value.ToString() == reserva.tipo_regimen)
                {
                    dgvRegimen.Rows[i].Selected = true;

                }
                else
                {
                    if (i < dgvRegimen.RowCount - 1)
                    {
                        dgvRegimen.Rows[i].Selected = false;
                    }
                }
            }
            for (int i = 0; i < dgvTipoHabitacion.RowCount; i++)
            {
                if (dgvTipoHabitacion.Rows[i].Cells[0].Value.ToString() == reserva.tipo_habitacion)
                {
                    dgvTipoHabitacion.Rows[i].Selected = true;

                }
                else
                {
                    if (i < dgvTipoHabitacion.RowCount - 1)
                    {
                        dgvTipoHabitacion.Rows[i].Selected = false;
                    }
                }
            }

        }

        private Reserva getDataToSearch()
        {
            Reserva reserva = new Reserva();

            reserva.id = Convert.ToInt32(txtIdReserva.Text);

            return reserva;
        }

        private void buttonGuardar_Click(object sender, EventArgs e)
        {
            Reserva reserva = this.getDataFromForm();
            ReservaHelper.update_reserva(reserva);
        }

        private Reserva getDataFromForm()
        {

            Reserva reserva = new Reserva();
            reserva.id_hotel = VarGlobal.usuario.hotel;
            reserva.id = Convert.ToInt32(txtIdReserva.Text);
            if (reserva.tipo_habitacion!= Convert.ToString(dgvTipoHabitacion.CurrentRow.Cells[0].Value)){
            reserva.tipo_habitacion = Convert.ToString(dgvTipoHabitacion.CurrentRow.Cells[0].Value);}
            if (reserva.tipo_regimen != Convert.ToString(dgvRegimen.CurrentRow.Cells[0].Value)){
                reserva.tipo_regimen = Convert.ToString(dgvRegimen.CurrentRow.Cells[0].Value);}
            reserva.fecha_inicio = dtFechaDesde.Value;
            reserva.fecha_fin = dtFechaHasta.Value;
            reserva.estadia = Convert.ToInt32((dtFechaHasta.Value - dtFechaDesde.Value).TotalDays);

            return reserva;
        }

        private void FormModificacionReserva_Load(object sender, EventArgs e)
        {

        }
    }
}
