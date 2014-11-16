using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System;
namespace FrbaHotel
{
    public class MenuHelper
    {
        public static SortedList<int, OpcionMenu> getOptionMenu(int idRol)
        {
            SortedList<int, OpcionMenu> menuOptions = new SortedList<int, OpcionMenu>();

            string storedProcedureName = "LA_MAYORIA.proc_listarMenuFuncionalidadPorRol";
            SqlCommand command = new SqlCommand(storedProcedureName);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@p_idRol", idRol);

            SqlDataReader reader = ProcedureHelper.execute(command) as SqlDataReader;

            int position = 0;
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    OpcionMenu menuOption = new OpcionMenu();
                    menuOption.descripcion = reader["descripcion"].ToString();
                    menuOption.idFuncionalidad = Convert.ToInt32(reader["idFuncionalidad"]);
                    menuOptions.Add(position, menuOption);
                    position++;
                }
            }

            return menuOptions;
        }
    }
}