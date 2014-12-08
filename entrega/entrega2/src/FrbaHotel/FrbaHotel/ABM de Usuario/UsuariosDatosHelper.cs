using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Usuario
{
    public class UsuarioDatosHelper
    {
        public static UsuarioDatos getUserData(String user)
        {
            UsuarioDatos userData = new UsuarioDatos();

            SqlConnection conn = Connection.getConnection();

            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = "LA_MAYORIA.sp_user_data_get_by_user";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@p_user_name", user);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                userData.username = user;
                userData.address = Convert.ToString(reader["Direccion"]);
                userData.birthDate = Convert.ToDateTime(reader["Fecha_Nacimiento"]);
                userData.documentNumber = Convert.ToInt32(reader["Nro_DNI"]);
                userData.mail = reader["mail"].ToString();
                userData.nameLastname = reader["Nombre_Apellido"].ToString();
                userData.telephone = reader["Telefono"].ToString();
                userData.typeDocument = Convert.ToInt16(reader["Tipo_DNI"]);
                userData.typeDocumentDescription = reader["Descripcion"].ToString();

                int enable = Convert.ToInt16(reader["Habilitado"]);

                if (enable == 1)
                    userData.enabled = true;
                else
                    userData.enabled = false;
            }

            conn.Close();

            return userData;
        }

        public static void save(UsuarioDatos userData, Int32 hotel, Int32 rol, String password)
        {
            SqlCommand sp_save_or_update_user = new SqlCommand();
            sp_save_or_update_user.CommandType = CommandType.StoredProcedure;
            sp_save_or_update_user.CommandText = "LA_MAYORIA.sp_user_save_update";

            sp_save_or_update_user.Parameters.AddWithValue("@p_user_name", userData.username);
            sp_save_or_update_user.Parameters.AddWithValue("@p_name_lastName", userData.nameLastname);
            sp_save_or_update_user.Parameters.AddWithValue("@p_id_type_document", userData.typeDocument);
            sp_save_or_update_user.Parameters.AddWithValue("@p_document_number", userData.documentNumber);
            sp_save_or_update_user.Parameters.AddWithValue("@p_mail", userData.mail);
            sp_save_or_update_user.Parameters.AddWithValue("@p_telephone", userData.telephone);
            sp_save_or_update_user.Parameters.AddWithValue("@p_address", userData.address);
            sp_save_or_update_user.Parameters.AddWithValue("@p_birthdate", userData.birthDate);
            
            if (userData.enabled){
                sp_save_or_update_user.Parameters.AddWithValue("@p_enabled", 1);
            }else{
                sp_save_or_update_user.Parameters.AddWithValue("@p_enabled", 0);
            }

            sp_save_or_update_user.Parameters.AddWithValue("@p_id_hotel", hotel);
            sp_save_or_update_user.Parameters.AddWithValue("@p_id_rol", rol);
            if (password != null)
                sp_save_or_update_user.Parameters.AddWithValue("@p_password", Encrypt.Sha256(password));

            ProcedureHelper.execute(sp_save_or_update_user, "save or update user data", false);
        }
    }
}
