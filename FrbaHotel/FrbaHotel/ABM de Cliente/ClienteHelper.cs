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
    }
}
