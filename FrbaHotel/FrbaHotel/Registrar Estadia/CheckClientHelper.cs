using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using FrbaHotel.ABM_de_Cliente;
using System.Windows.Forms;

namespace FrbaHotel.Registrar_Estadia
{
    public class CheckClientHelper
    {
        public static void search(Cliente client, DataGridView dgvCheckClient)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_check_client_search";

            command.Parameters.Add(new SqlParameter("@p_check_client_name", SqlDbType.VarChar, 255));
            if (client.name == string.Empty)
                command.Parameters["@p_check_client_name"].Value = null;
            else
                command.Parameters["@p_check_client_name"].Value = client.name;

            command.Parameters.Add(new SqlParameter("@p_check_client_lastname", SqlDbType.VarChar, 255));
            if (client.lastname == string.Empty)
                command.Parameters["@p_check_client_lastname"].Value = null;
            else
                command.Parameters["@p_check_client_lastname"].Value = client.lastname;

            command.Parameters.Add(new SqlParameter("@p_check_client_document_number", SqlDbType.VarChar, 255));
            if (client.documentNumber == 0)
                command.Parameters["@p_check_client_document_number"].Value = null;
            else
                command.Parameters["@p_check_client_document_number"].Value = client.documentNumber;

            DataGridViewHelper.fill(command, dgvCheckClient);
        }
    }
}
