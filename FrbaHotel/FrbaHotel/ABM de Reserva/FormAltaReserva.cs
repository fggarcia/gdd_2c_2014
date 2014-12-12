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
            if ((dTDesde.Value > DateTime.Now) && (dTHasta.Value > DateTime.Now))

            {
                
                
                    Reserva reserva = this.getdataConsulta();
                    int disponible = ReservaHelper.check_hotel_availability(reserva);
                    if (disponible == 1)

                        MessageBox.Show("Hay disponibilidad de Habitacion");


                    else
                        MessageBox.Show("No hay disponibilidad de Habitacion. Elija otro rango de fechas u otro tipo de habitacion");
                
            }
            else
            {
                MessageBox.Show("Verificar las fechas Desde y Hasta");
            }
                
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
