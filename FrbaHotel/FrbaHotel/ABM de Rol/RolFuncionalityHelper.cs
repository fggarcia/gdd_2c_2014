using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace FrbaHotel.ABM_de_Rol
{
    public class RolFuncionalityHelper
    {
        public static void geFunctionalityByRolAvailability(Int32 idRol, DataGridView dvgRolFunctionality)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_rol_functionality_availability";

            command.Parameters.Add(new SqlParameter("@p_id_rol", SqlDbType.Int));
            command.Parameters["@p_id_rol"].Value = idRol;

            DataGridViewHelper.fill(command, dvgRolFunctionality);
        }

        public static void getFunctionalityByRolEnabled(Int32 idRol, DataGridView dvgRolFunctionality)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_rol_functionality_enabled";

            command.Parameters.Add(new SqlParameter("@p_id_rol", SqlDbType.Int));
            command.Parameters["@p_id_rol"].Value = idRol;

            DataGridViewHelper.fill(command, dvgRolFunctionality);
        }

        public static void setFunctionalityToRol(Int32 idRol, Int32 idFunctionality)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_rol_functionality_add";

            command.Parameters.Add(new SqlParameter("@p_id_rol", SqlDbType.Int));
            command.Parameters["@p_id_rol"].Value = idRol;
            command.Parameters.Add(new SqlParameter("@p_id_functionality", SqlDbType.Int));
            command.Parameters["@p_id_functionality"].Value = idFunctionality;

            ProcedureHelper.execute(command, "agregar funcionalidad a rol", false);
        }

        public static void removeFunctionalityToRol(Int32 idRol, Int32 idFunctionality)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_rol_functionality_remove";

            command.Parameters.Add(new SqlParameter("@p_id_rol", SqlDbType.Int));
            command.Parameters["@p_id_rol"].Value = idRol;
            command.Parameters.Add(new SqlParameter("@p_id_functionality", SqlDbType.Int));
            command.Parameters["@p_id_functionality"].Value = idFunctionality;

            ProcedureHelper.execute(command, "agregar funcionalidad a rol", false);
        }
    }
}
