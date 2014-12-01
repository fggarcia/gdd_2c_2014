using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace FrbaHotel.ABM_de_Habitacion
{
    public class HabitacionHelper
    {
        public static void search(Habitacion room, DataGridView dgvRoom)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_habitacion_search";

            command.Parameters.Add(new SqlParameter("@p_habitacion_id", SqlDbType.Int));
            if (room.id == 0)
                command.Parameters["@p_habitacion_id"].Value = null;
            else
                command.Parameters["@p_habitacion_id"].Value = room.id;

            command.Parameters.Add(new SqlParameter("@p_habitacion_hotel_id", SqlDbType.Int));
            if (room.hotel == 0)
                command.Parameters["@p_habitacion_hotel_id"].Value = null;
            else
                command.Parameters["@p_habitacion_hotel_id"].Value = room.hotel;

            command.Parameters.Add(new SqlParameter("@p_habitacion_floor", SqlDbType.Int));
            if (room.floor == 0)
                command.Parameters["@p_habitacion_floor"].Value = null;
            else
                command.Parameters["@p_habitacion_floor"].Value = room.floor;

            command.Parameters.Add(new SqlParameter("@p_habitacion_type", SqlDbType.Int));
            if (room.type == 0)
                command.Parameters["@p_habitacion_type"].Value = null;
            else
                command.Parameters["@p_habitacion_type"].Value = room.type;

            command.Parameters.Add(new SqlParameter("@p_habitacion_front", SqlDbType.Int));
            if (room.front == 0)
                command.Parameters["@p_habitacion_front"].Value = null;
            else
                command.Parameters["@p_habitacion_front"].Value = room.front;

            command.Parameters.Add(new SqlParameter("@p_habitacion_comodity", SqlDbType.VarChar, 255));
            if (room.comodity == String.Empty)
                command.Parameters["@p_habitacion_comodity"].Value = null;
            else
                command.Parameters["@p_habitacion_comodity"].Value = room.comodity;

            command.Parameters.Add(new SqlParameter("@p_user_name", SqlDbType.VarChar, 20));
            command.Parameters["@p_user_name"].Value = VarGlobal.usuario.id;

            DataGridViewHelper.fill(command, dgvRoom);
        }
    }
}
