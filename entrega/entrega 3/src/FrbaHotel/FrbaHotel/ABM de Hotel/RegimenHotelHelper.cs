using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Hotel
{
    public class RegimenHotelHelper
    {
        public static void getRegimenHotelAvailable(Int32 hotelId, DataGridView dgvRegimenHotel)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_regimen_available";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = hotelId;

            DataGridViewHelper.fill(command, dgvRegimenHotel);
        }

        public static void getRegimenHotelAssign(Int32 hotelId, DataGridView dgvRegimenHotel)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_regimen_assign";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = hotelId;

            DataGridViewHelper.fill(command, dgvRegimenHotel);
        }
        
        public static void setRegimenToHotel(Int32 hotelId, Int32 regimenId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_regimen_add";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = hotelId;
            command.Parameters.Add(new SqlParameter("@p_regimen_id", SqlDbType.Int));
            command.Parameters["@p_regimen_id"].Value = regimenId;

            ProcedureHelper.execute(command, "agregar regimen a hotel", false);
        }

        public static Boolean removeRegimenToHotel(Int32 hotelId, Int32 regimenId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_regimen_remove";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = hotelId;
            command.Parameters.Add(new SqlParameter("@p_regimen_id", SqlDbType.Int));
            command.Parameters["@p_regimen_id"].Value = regimenId;
            var returnParameterRemoveOk = command.Parameters.Add(new SqlParameter("@p_remove_ok", SqlDbType.Int));
            returnParameterRemoveOk.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "remover regimen a hotel", false);

            Int16 enable = Convert.ToInt16(returnParameterRemoveOk.Value);

            if (enable != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
