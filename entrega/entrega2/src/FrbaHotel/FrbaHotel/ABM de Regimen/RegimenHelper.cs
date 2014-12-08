using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace FrbaHotel.ABM_de_Regimen
{
    public class RegimenHelper
    {
        public static void search(String description, DataGridView dgvRegimen)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_regimen_search";

            command.Parameters.Add(new SqlParameter("@p_regimen_description", SqlDbType.VarChar, 255));
            if (description == string.Empty)
                command.Parameters["@p_regimen_description"].Value = null;
            else
                command.Parameters["@p_regimen_description"].Value = description;

            DataGridViewHelper.fill(command, dgvRegimen);
        }
    }

}
