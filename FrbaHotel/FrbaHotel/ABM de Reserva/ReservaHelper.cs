using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using FrbaHotel.ABM_de_Reserva;


namespace FrbaHotel.ABM_de_Reserva
{
    public class ReservaHelper
    {
        public static void search(Int32 hotel, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_reserva_listar";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            if (VarGlobal.usuario.hotel.Equals(0))
                Validaciones.validAndRequiredInt32(VarGlobal.usuario.hotel.ToString(), "Numero de hotel incorrecto");
            else
                command.Parameters["@p_hotel_id"].Value = VarGlobal.usuario.hotel;

            DataGridViewHelper.fill(command, dgvReserva);
        }

        public static void search_regimen(Int32 hotel, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_regimen_retrieve";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            if (VarGlobal.usuario.hotel.Equals(0))
                Validaciones.validAndRequiredInt32(VarGlobal.usuario.hotel.ToString(), "Numero de hotel incorrecto");
            else
                command.Parameters["@p_hotel_id"].Value = VarGlobal.usuario.hotel;

            DataGridViewHelper.fill(command, dgvReserva);
        }

      }
}
