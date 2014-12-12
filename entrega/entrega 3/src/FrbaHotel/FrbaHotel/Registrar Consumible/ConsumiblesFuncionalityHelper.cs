using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using FrbaHotel.ABM_de_Consumibles;

namespace FrbaHotel.Registrar_Consumible
{

    public class ConsumiblesFuncionalityHelper
    {
        public static void getConsumibleByFilter(String filter, DataGridView dgvConsumibleFunctionality)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_consumible_filter";

            command.Parameters.Add(new SqlParameter("@p_d_filter", SqlDbType.VarChar,255));
            command.Parameters["@p_d_filter"].Value = filter;

            DataGridViewHelper.fill(command, dgvConsumibleFunctionality);
        }

        public static void getConsumibleByEstadia(Int32 idEstadia, DataGridView dvgRolFunctionality)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_consumible_by_estadia_search";

            command.Parameters.Add(new SqlParameter("@p_id_estadia", SqlDbType.Int));
            command.Parameters["@p_id_estadia"].Value = idEstadia;

            DataGridViewHelper.fill(command, dvgRolFunctionality);
        }

        public static void addConsumibleToEstadia(String idusuario, Int32 idEstadia, Consumible c)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_consumible_add";

            command.Parameters.Add(new SqlParameter("@p_id_usuario", SqlDbType.VarChar, 255));
            command.Parameters["@p_id_usuario"].Value = idusuario;
            command.Parameters.Add(new SqlParameter("@p_id_estadia", SqlDbType.Int));
            command.Parameters["@p_id_estadia"].Value = idEstadia;
            command.Parameters.Add(new SqlParameter("@p_id_consumible", SqlDbType.Int));
            command.Parameters["@p_id_consumible"].Value = c.id;
            command.Parameters.Add(new SqlParameter("@p_cantidad", SqlDbType.Int));
            command.Parameters["@p_cantidad"].Value = c.cantidad;

            ProcedureHelper.execute(command, "agregar consumible a estadia", false);
        }

        public static void removeConsumibleToEstadia(Int32 idEstadia, Int32 idConsumible)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_consumible_remove";

            command.Parameters.Add(new SqlParameter("@p_id_estadia", SqlDbType.Int));
            command.Parameters["@p_id_estadia"].Value = idEstadia;
            command.Parameters.Add(new SqlParameter("@p_id_consumible", SqlDbType.Int));
            command.Parameters["@p_id_consumible"].Value = idConsumible;

            ProcedureHelper.execute(command, "quitar consumible a estadia", false);
        }

    }
}