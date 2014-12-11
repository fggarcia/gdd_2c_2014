using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Common;

namespace FrbaHotel.ABM_de_Reserva
{
    public partial class FormAltaReserva : Form
    {
        public FormAltaReserva()
        {
            InitializeComponent();
        }

        private void FormAltaReserva_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.WindowState = FormWindowState.Maximized;
            ReservaHelper.search_regimen(VarGlobal.usuario.hotel, dgvRegimen);
            ReservaHelper.search_tipo_hab(VarGlobal.usuario.hotel, dgvTipoHabitacion);
        }

        private void button_volver_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button_consultar_Click(object sender, EventArgs e)
        {
            Reserva reserva = this.getdataConsulta();
            int ocupacion=ReservaHelper.search_occupied(reserva);
            int cantidad = ReservaHelper.search_room_quantity(reserva);
            if (ocupacion < cantidad)
                MessageBox.Show("Hay disponibilidad de Habitacion");

        }

        private Reserva getdataConsulta()
        {
            Reserva reserva = new Reserva();

            reserva.id_hotel = VarGlobal.usuario.hotel;
            reserva.fecha_inicio = dTDesde.Value;
            reserva.fecha_fin = dTHasta.Value;
            reserva.tipo_habitacion = dgvTipoHabitacion.CurrentRow.Cells[0].Value.ToString();
            return reserva;
        }

    }
}
