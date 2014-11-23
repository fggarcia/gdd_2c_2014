using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace FrbaHotel.Hotel
{
    public class Hoteles
    {
        public static int fillHotelByUser(Usuario user)
        {
            SqlCommand sp_rol_exist_one_by_user = new SqlCommand();
            sp_rol_exist_one_by_user.CommandText = "LA_MAYORIA.sp_hotel_exist_one_by_user";
            sp_rol_exist_one_by_user.Parameters.Add(new SqlParameter("@p_id", SqlDbType.VarChar));
            sp_rol_exist_one_by_user.Parameters["@p_id"].Value = user.id;

            var returnParameterCountHotel = sp_rol_exist_one_by_user.Parameters.Add(new SqlParameter("@p_count_hotel", SqlDbType.Int));
            returnParameterCountHotel.Direction = ParameterDirection.InputOutput;
            var returnParameterIdHotel = sp_rol_exist_one_by_user.Parameters.Add(new SqlParameter("@p_id_hotel", SqlDbType.Int));
            returnParameterIdHotel.Direction = ParameterDirection.InputOutput;
            var returnParameterHotelDesc = sp_rol_exist_one_by_user.Parameters.Add(new SqlParameter("@p_hotel_desc", SqlDbType.VarChar, 255));
            returnParameterHotelDesc.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_rol_exist_one_by_user, "chequear si un usuario tiene un solo hotel asignado", false);

            int countHotel = Convert.ToInt16(returnParameterCountHotel.Value);

            if (countHotel == 1)
            {
                int id = Convert.ToInt16(returnParameterIdHotel.Value);

                user.hotel = id;
            }

            return countHotel;
        }

        public static void fillComboBoxByUser(ComboBox comboBox_Hotel, Usuario user)
        {
            ComboBoxHelper.fill(comboBox_Hotel, "LA_MAYORIA.Usuario_Hotel uh INNER JOIN LA_MAYORIA.Hotel h ON uh.Id_Hotel = h.Id_Hotel",
                "uh.Id_Hotel", "uh.Id_Hotel", "uh.Id_Usuario = '" + user.id + "' AND h.Habilitado = 1 AND uh.Habilitado = 1", "uh.Id_Hotel ASC");
        }

        public static void fillComboBox(ComboBox comboBox)
        {
            ComboBoxHelper.fill(comboBox, "LA_MAYORIA.Hotel h",
                "h.Id_Hotel", "h.Id_Hotel", "h.Habilitado = 1", "h.Id_Hotel ASC");
        }
    }
}
