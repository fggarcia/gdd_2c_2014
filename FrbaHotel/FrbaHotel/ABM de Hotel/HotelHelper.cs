using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using FrbaHotel.Common;

namespace FrbaHotel.ABM_de_Hotel
{
    public class HotelHelper
    {
        public static void search(Hotel hotel, DataGridView dgvHotel)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_search";

            command.Parameters.Add(new SqlParameter("@p_hotel_name", SqlDbType.VarChar, 255));
            if (hotel.name == string.Empty)
                command.Parameters["@p_hotel_name"].Value = null;
            else
                command.Parameters["@p_hotel_name"].Value = hotel.name;

            command.Parameters.Add(new SqlParameter("@p_hotel_city", SqlDbType.VarChar, 255));
            if (hotel.city == string.Empty)
                command.Parameters["@p_hotel_city"].Value = null;
            else
                command.Parameters["@p_hotel_city"].Value = hotel.city;

            command.Parameters.Add(new SqlParameter("@p_hotel_country", SqlDbType.VarChar, 255));
            if (hotel.country == String.Empty)
                command.Parameters["@p_hotel_country"].Value = null;
            else
                command.Parameters["@p_hotel_country"].Value = hotel.country;

            command.Parameters.Add(new SqlParameter("@p_hotel_star", SqlDbType.Int));
            if (hotel.star == 0)
                command.Parameters["@p_hotel_star"].Value = null;
            else
                command.Parameters["@p_hotel_star"].Value = hotel.star;

            command.Parameters.Add(new SqlParameter("@p_hotel_user_id", SqlDbType.VarChar, 255));
            command.Parameters["@p_hotel_user_id"].Value = VarGlobal.usuario.id;

            DataGridViewHelper.fill(command, dgvHotel);
        }

        public static void enable(Int32 id, Boolean enable)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_enable_disable";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = id;

            command.Parameters.Add(new SqlParameter("@p_enable_disable", SqlDbType.Int));
            if (enable)
            {
                command.Parameters["@p_enable_disable"].Value = 1;
            }
            else
            {
                command.Parameters["@p_enable_disable"].Value = 0;
            }

            ProcedureHelper.execute(command, "Habilitar o deshabilitar hotel", false);
        }

        public static Hotel getHotelData(Int32 hotelId)
        {
            Hotel hotelData = new Hotel();

            SqlConnection conn = Connection.getConnection();

            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = "LA_MAYORIA.sp_hotel_data_get_by_id";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@p_hotel_id", hotelId);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                hotelData.id = hotelId;
                hotelData.name = Convert.ToString(reader["Nombre"]);
                hotelData.mail = Convert.ToString(reader["Mail"]);
                hotelData.telephone = Convert.ToString(reader["Telefono"]);
                hotelData.star = Convert.ToInt32(reader["Estrellas"]);
                hotelData.address = Convert.ToString(reader["Direccion"]);
                hotelData.addressNumber = Convert.ToInt32(reader["Direccion Nro"]);
                hotelData.city = Convert.ToString(reader["Ciudad"]);
                hotelData.country = Convert.ToString(reader["Pais"]);
                hotelData.creation = Convert.ToDateTime(reader["Creacion"]);

                int enable = Convert.ToInt16(reader["Habilitado"]);

                if (enable == 1)
                    hotelData.enable = true;
                else
                    hotelData.enable = false;
            }

            conn.Close();

            return hotelData;
        }

        public static Int32 save(Hotel hotelData)
        {
            SqlCommand sp_save_or_update_client = new SqlCommand();
            sp_save_or_update_client.CommandType = CommandType.StoredProcedure;
            sp_save_or_update_client.CommandText = "LA_MAYORIA.sp_hotel_save_update";

            var returnParameterHotelId = sp_save_or_update_client.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            returnParameterHotelId.Direction = ParameterDirection.InputOutput;
            sp_save_or_update_client.Parameters["@p_hotel_id"].Value = hotelData.id;

            sp_save_or_update_client.Parameters.AddWithValue("@p_user_id", VarGlobal.usuario.id);
            sp_save_or_update_client.Parameters.AddWithValue("@p_user_rol_id", VarGlobal.usuario.rol.id);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_name", hotelData.name);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_mail", hotelData.mail);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_address", hotelData.address);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_address_number", hotelData.addressNumber);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_telephone", hotelData.telephone);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_city", hotelData.city);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_country", hotelData.country);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_star", hotelData.star);
            sp_save_or_update_client.Parameters.AddWithValue("@p_hotel_creation", hotelData.creation);
            
            ProcedureHelper.execute(sp_save_or_update_client, "save or update hotel data", false);

            return Convert.ToInt32(returnParameterHotelId.Value);
        }

        public static Boolean closePeriod(int hotelId, Period period)
        {
            SqlCommand sp_hotel_close_period_valid = new SqlCommand();
            sp_hotel_close_period_valid.CommandType = CommandType.StoredProcedure;
            sp_hotel_close_period_valid.CommandText = "LA_MAYORIA.sp_hotel_close_period_valid";

            var returnParameterAddOk = sp_hotel_close_period_valid.Parameters.Add(new SqlParameter("@p_add_ok", SqlDbType.Int));
            returnParameterAddOk.Direction = ParameterDirection.InputOutput;

            sp_hotel_close_period_valid.Parameters.AddWithValue("@p_user_id", VarGlobal.usuario.id);
            sp_hotel_close_period_valid.Parameters.AddWithValue("@p_hotel_id", hotelId);
            sp_hotel_close_period_valid.Parameters.AddWithValue("@p_hotel_close_period_from", period.from);
            sp_hotel_close_period_valid.Parameters.AddWithValue("@p_hotel_close_period_to", period.to);
            sp_hotel_close_period_valid.Parameters.AddWithValue("@p_hotel_close_period_motive", period.motive);

            Int16 enable = Convert.ToInt16(returnParameterAddOk.Value);

            if (enable != 0)
            {
                return true;
            }else
            {
                return false;
            }
        }
    }
}
