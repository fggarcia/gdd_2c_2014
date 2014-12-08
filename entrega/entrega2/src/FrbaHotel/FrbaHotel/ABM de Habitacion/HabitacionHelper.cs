using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;
using FrbaHotel.Common;

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

        public static bool closePeriod(Int32 hotelId, Int32 floorId, Int32 roomId, Period period)
        {
            SqlCommand sp_habitacion_close_period_valid = new SqlCommand();
            sp_habitacion_close_period_valid.CommandType = CommandType.StoredProcedure;
            sp_habitacion_close_period_valid.CommandText = "LA_MAYORIA.sp_habitacion_close_period_valid";

            sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_habitacion_id", SqlDbType.Int));
            sp_habitacion_close_period_valid.Parameters["@p_habitacion_id"].Value = roomId;

            sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_habitacion_floor_id", SqlDbType.Int));
            sp_habitacion_close_period_valid.Parameters["@p_habitacion_floor_id"].Value = floorId;

            sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_habitacion_hotel_id", SqlDbType.Int));
            sp_habitacion_close_period_valid.Parameters["@p_habitacion_hotel_id"].Value = hotelId;

            sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_habitacion_close_period_from", SqlDbType.DateTime));
            sp_habitacion_close_period_valid.Parameters["@p_habitacion_close_period_from"].Value = period.from;

            sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_habitacion_close_period_to", SqlDbType.DateTime));
            sp_habitacion_close_period_valid.Parameters["@p_habitacion_close_period_to"].Value = period.to;

            sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_habitacion_close_period_motive", SqlDbType.VarChar, 255));
            sp_habitacion_close_period_valid.Parameters["@p_habitacion_close_period_motive"].Value = period.motive;

            sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_user_id", SqlDbType.VarChar, 20));
            sp_habitacion_close_period_valid.Parameters["@p_user_id"].Value = VarGlobal.usuario.id ;

            var returnParameterAddOk = sp_habitacion_close_period_valid.Parameters.Add(new SqlParameter("@p_add_ok", SqlDbType.Int));
            returnParameterAddOk.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_habitacion_close_period_valid, "check down period", false);

            Int16 enable = Convert.ToInt16(returnParameterAddOk.Value);

            if (enable != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static Habitacion getRoomData(Int32 hotelId, Int32 floorId, Int32 roomId)
        {
            Habitacion roomData = new Habitacion();

            SqlConnection conn = Connection.getConnection();

            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = "LA_MAYORIA.sp_habitacion_data_get_by_id";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@p_habitacion_id", roomId);
            command.Parameters.AddWithValue("@p_habitacion_hotel_id", hotelId);
            command.Parameters.AddWithValue("@p_habitacion_floor_id", floorId);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                roomData.id = roomId;
                roomData.hotel = hotelId;
                roomData.hotelName = reader["HotelNombre"].ToString();
                roomData.floor = Convert.ToInt32(reader["Piso"]);
                roomData.front = Convert.ToInt32(reader["IdFrente"]);
                roomData.frontDescription = reader["FrenteDescripcion"].ToString();
                roomData.type = Convert.ToInt32(reader["IdTipoHabitacion"]);
                roomData.typeDescription = reader["TipoHabitacion"].ToString();
                roomData.comodity = reader["Comodidades"].ToString();
            }

            conn.Close();

            return roomData;
        }

        public static void save(Habitacion roomData)
        {
            SqlCommand sp_save_or_update_room = new SqlCommand();
            sp_save_or_update_room.CommandType = CommandType.StoredProcedure;
            sp_save_or_update_room.CommandText = "LA_MAYORIA.sp_habitacion_save_update";

            sp_save_or_update_room.Parameters.AddWithValue("@p_habitacion_id", roomData.id);
            sp_save_or_update_room.Parameters.AddWithValue("@p_habitacion_hotel_id", roomData.hotel);
            sp_save_or_update_room.Parameters.AddWithValue("@p_habitacion_floor_id", roomData.floor);
            sp_save_or_update_room.Parameters.AddWithValue("@p_habitacion_type", roomData.type);
            sp_save_or_update_room.Parameters.AddWithValue("@p_habitacion_front", roomData.front);
            sp_save_or_update_room.Parameters.AddWithValue("@p_habitacion_comodity", roomData.comodity);

            ProcedureHelper.execute(sp_save_or_update_room, "save or update room data", false);
        }

        public static Boolean existHotelRoom(Int32 hotelId, Int32 floorId, Int32 roomId)
        {
            SqlCommand sp_habitacion_exist_hotel_room = new SqlCommand();
            sp_habitacion_exist_hotel_room.CommandType = CommandType.StoredProcedure;
            sp_habitacion_exist_hotel_room.CommandText = "LA_MAYORIA.sp_habitacion_exist_hotel_room";

            sp_habitacion_exist_hotel_room.Parameters.AddWithValue("@p_habitacion_id", roomId);
            sp_habitacion_exist_hotel_room.Parameters.AddWithValue("@p_habitacion_hotel_id", hotelId);
            sp_habitacion_exist_hotel_room.Parameters.AddWithValue("@p_habitacion_floor_id", floorId);

            var returnParameterExist = sp_habitacion_exist_hotel_room.Parameters.Add(new SqlParameter("@p_exist", SqlDbType.Bit));
            returnParameterExist.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_habitacion_exist_hotel_room, "check if exist a room", false);

            Int16 enable = Convert.ToInt16(returnParameterExist.Value);

            if (enable != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
