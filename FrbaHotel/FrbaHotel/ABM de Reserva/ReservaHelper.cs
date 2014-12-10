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
        public static void search(Reserva reserva, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            
            command.CommandText = "LA_MAYORIA.sp_reserva_listar";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = reserva.id_hotel;
            
            command.Parameters.Add(new SqlParameter("@p_nombre", SqlDbType.VarChar,255));

            if (reserva.nombre == string.Empty)
                command.Parameters["@p_nombre"].Value = null;
            else
                command.Parameters["@p_nombre"].Value = reserva.nombre;


            command.Parameters.Add(new SqlParameter("@p_apellido", SqlDbType.VarChar, 255));

           if (reserva.apellido == string.Empty)
                command.Parameters["@p_apellido"].Value = null;
            else
                command.Parameters["@p_apellido"].Value = reserva.apellido;

            /*command.Parameters.Add(new SqlParameter("@p_res_id", SqlDbType.Int));
            command.Parameters["@p_res_id"].Value = reserva.id;*/

            DataGridViewHelper.fill(command, dgvReserva);
        }

        public static void search_regimen(Int32 hotel, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_regimen_retrieve";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = VarGlobal.usuario.hotel;

            DataGridViewHelper.fill(command, dgvReserva);
        }

        public static void search_tipo_hab(Int32 hotel, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_tipo_habitacion_available";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = VarGlobal.usuario.hotel;

            DataGridViewHelper.fill(command, dgvReserva);
        }

      }
}
