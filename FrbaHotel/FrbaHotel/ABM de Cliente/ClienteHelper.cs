using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace FrbaHotel.ABM_de_Cliente
{
    public class ClienteHelper
    {
        public static void search(Cliente client, DataGridView dgvClient)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_client_search";

            command.Parameters.Add(new SqlParameter("@p_client_name", SqlDbType.VarChar, 255));
            if (client.name == string.Empty)
                command.Parameters["@p_client_name"].Value = null;
            else
                command.Parameters["@p_client_name"].Value = client.name;

            command.Parameters.Add(new SqlParameter("@p_client_lastname", SqlDbType.VarChar, 255));
            if (client.lastname == string.Empty)
                command.Parameters["@p_client_lastname"].Value = null;
            else
                command.Parameters["@p_client_lastname"].Value = client.lastname;

            command.Parameters.Add(new SqlParameter("@p_id_type_document", SqlDbType.Int));
            if (client.idTypeDocument == 0)
                command.Parameters["@p_id_type_document"].Value = null;
            else
                command.Parameters["@p_id_type_document"].Value = client.idTypeDocument;

            command.Parameters.Add(new SqlParameter("@p_client_document_number", SqlDbType.VarChar, 255));
            if (client.documentNumber == 0)
                command.Parameters["@p_client_document_number"].Value = null;
            else
                command.Parameters["@p_client_document_number"].Value = client.documentNumber.ToString();

            command.Parameters.Add(new SqlParameter("@p_client_mail", SqlDbType.VarChar, 255));
            if (client.mail == string.Empty)
                command.Parameters["@p_client_mail"].Value = null;
            else
                command.Parameters["@p_client_mail"].Value = client.mail;

            DataGridViewHelper.fill(command, dgvClient);
        }

        public static void enable(Int32 id, Boolean enable)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_client_enable_disable";

            command.Parameters.Add(new SqlParameter("@p_client_id", SqlDbType.Int));
            command.Parameters["@p_client_id"].Value = id;

            command.Parameters.Add(new SqlParameter("@p_enable_disable", SqlDbType.Int));
            if (enable)
            {
                command.Parameters["@p_enable_disable"].Value = 1;
            }
            else
            {
                command.Parameters["@p_enable_disable"].Value = 0;
            }

            ProcedureHelper.execute(command, "Habilitar o deshabilitar client", false);
        }

        public static Cliente getClientData(String clientId)
        {
            Cliente clientData = new Cliente();

            SqlConnection conn = Connection.getConnection();

            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = "LA_MAYORIA.sp_client_data_get_by_id_client";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@p_id_client", clientId);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                clientData.id = Convert.ToInt32(clientId);
                clientData.name = Convert.ToString(reader["Nombre"]);
                clientData.lastname = Convert.ToString(reader["Apellido"]);
                clientData.idTypeDocument = Convert.ToInt32(reader["Tipo_Identificacion"]);
                clientData.typeDocument = Convert.ToString(reader["Identificacion_Descripcion"]);
                clientData.documentNumber = Convert.ToInt32(reader["Nro_Identificacion"]);
                clientData.mail = Convert.ToString(reader["Mail"]);
                clientData.telephone = Convert.ToString(reader["Telefono"]);
                clientData.addressName = Convert.ToString(reader["Calle_Direccion"]);
                clientData.addressNum = Convert.ToInt32(reader["Calle_Nro"]);
                if (reader["Calle_Piso"] != DBNull.Value)
                    clientData.addressFloor = Convert.ToInt32(reader["Calle_Piso"]);
                if (reader["Calle_Nro"] != DBNull.Value)
                clientData.adressDeptName = Convert.ToString(reader["Calle_Depto"]);
                clientData.idNacionality = Convert.ToInt32(reader["Nacionalidad"]);
                clientData.nacionality = Convert.ToString(reader["Nacionalidad_Descripcion"]);
                clientData.birthdate = Convert.ToDateTime(reader["Fecha_Nacimiento"]);
                
                int enable = Convert.ToInt16(reader["Habilitado"]);

                if (enable == 1)
                    clientData.enable = true;
                else
                    clientData.enable = false;
            }

            conn.Close();

            return clientData;
        }

        public static void save(Cliente clientData)
        {
            SqlCommand sp_save_or_update_client = new SqlCommand();
            sp_save_or_update_client.CommandType = CommandType.StoredProcedure;
            sp_save_or_update_client.CommandText = "LA_MAYORIA.sp_client_save_update";


            sp_save_or_update_client.Parameters.AddWithValue("@p_client_id", clientData.id);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_name", clientData.name);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_lastname", clientData.lastname);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_type_document", clientData.typeDocument);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_document_number", clientData.documentNumber);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_mail", clientData.mail);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_telephone", clientData.telephone);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_address_name", clientData.addressName);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_address_number", clientData.addressNum);
            
            if(clientData.addressFloor != VarGlobal.NoAddressFloor){
                sp_save_or_update_client.Parameters.AddWithValue("@p_client_address_floor", clientData.addressFloor);
                sp_save_or_update_client.Parameters.AddWithValue("@p_client_address_dept", clientData.adressDeptName);
            }

            sp_save_or_update_client.Parameters.AddWithValue("@p_client_nationality", clientData.nacionality);
            sp_save_or_update_client.Parameters.AddWithValue("@p_client_birthdate", clientData.birthdate);

            ProcedureHelper.execute(sp_save_or_update_client, "save or update client data", false);
        }

        public static Boolean checkTypeAndDocumentNumber(Int32 clientId, String typeDocument, Int32 documentNumber)
        {
            SqlCommand sp_client_check_exist_document = new SqlCommand();
            sp_client_check_exist_document.CommandText = "LA_MAYORIA.sp_client_check_exist_document";
            sp_client_check_exist_document.Parameters.Add(new SqlParameter("@p_client_id", SqlDbType.Int));
            sp_client_check_exist_document.Parameters["@p_client_id"].Value = clientId;

            sp_client_check_exist_document.Parameters.Add(new SqlParameter("@p_client_type_document", SqlDbType.VarChar, 255));
            sp_client_check_exist_document.Parameters["@p_client_type_document"].Value = typeDocument;

            sp_client_check_exist_document.Parameters.Add(new SqlParameter("@p_client_document_number", SqlDbType.Int));
            sp_client_check_exist_document.Parameters["@p_client_document_number"].Value = documentNumber;

            var returnParametersIsValid = sp_client_check_exist_document.Parameters.Add(new SqlParameter("@p_isValid", SqlDbType.Int));
            returnParametersIsValid.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_client_check_exist_document, "chequear tipo y numero de documento", false);

            if (Convert.ToInt16(returnParametersIsValid.Value) == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public static Boolean checkMail(Int32 clientId, String mail)
        {
            SqlCommand sp_client_check_exist_mail = new SqlCommand();
            sp_client_check_exist_mail.CommandText = "LA_MAYORIA.sp_client_check_exist_mail";
            sp_client_check_exist_mail.Parameters.Add(new SqlParameter("@p_client_id", SqlDbType.Int));
            sp_client_check_exist_mail.Parameters["@p_client_id"].Value = clientId;

            sp_client_check_exist_mail.Parameters.Add(new SqlParameter("@p_client_mail", SqlDbType.VarChar));
            sp_client_check_exist_mail.Parameters["@p_client_mail"].Value = mail;

            var returnParametersIsValid = sp_client_check_exist_mail.Parameters.Add(new SqlParameter("@p_isValid", SqlDbType.Int));
            returnParametersIsValid.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_client_check_exist_mail, "chequear mail", false);

            if (Convert.ToInt16(returnParametersIsValid.Value) == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}
