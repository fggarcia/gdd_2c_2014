using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace FrbaHotel.Registrar_Estadia
{
    public class RegisterStayHelper
    {
        public static void search(Int32 bookingId, DataGridView dgvRegisterStay)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_booking_search";

            command.Parameters.Add(new SqlParameter("@p_stay_booking_id", SqlDbType.Int));
            command.Parameters["@p_stay_booking_id"].Value = bookingId;

            command.Parameters.Add(new SqlParameter("@p_stay_hotel_id", SqlDbType.Int));
            command.Parameters["@p_stay_hotel_id"].Value = VarGlobal.usuario.hotel;

            DataGridViewHelper.fill(command, dgvRegisterStay);
        }

        public static BookingStatus bookingStatus(Int32 bookingId)
        {
            BookingStatus status = new BookingStatus();

            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_booking_search";

            command.Parameters.Add(new SqlParameter("@p_stay_booking_id", SqlDbType.Int));
            command.Parameters["@p_stay_booking_id"].Value = bookingId;

            command.Parameters.Add(new SqlParameter("@p_stay_hotel_id", SqlDbType.Int));
            command.Parameters["@p_stay_hotel_id"].Value = VarGlobal.usuario.hotel;

            var returnParameterCancel = command.Parameters.Add(new SqlParameter("@p_stay_booking_cancel", SqlDbType.Bit));
            returnParameterCancel.Direction = ParameterDirection.Output;

            var returnParameterExist = command.Parameters.Add(new SqlParameter("@p_stay_booking_exist", SqlDbType.Bit));
            returnParameterExist.Direction = ParameterDirection.Output;

            var returnParameterBefore = command.Parameters.Add(new SqlParameter("@p_stay_booking_before", SqlDbType.Bit));
            returnParameterBefore.Direction = ParameterDirection.Output;

            var returnParameterHotel = command.Parameters.Add(new SqlParameter("@p_stay_booking_hotel", SqlDbType.Bit));
            returnParameterHotel.Direction = ParameterDirection.Output;

            ProcedureHelper.execute(command, "check if booking is before today", false);

            Int16 cancel = Convert.ToInt16(returnParameterCancel.Value);
            Int16 exist = Convert.ToInt16(returnParameterExist.Value);
            Int16 before = Convert.ToInt16(returnParameterBefore.Value);
            Int16 hotel = Convert.ToInt16(returnParameterHotel.Value);

            if (cancel == 0)
                status.cancel = false;
            else
                status.cancel = true;

            if (exist == 0)
                status.exist = false;
            else
                status.exist = true;

            if (before == 0)
                status.before = false;
            else
                status.before = true;

            if (hotel == 0)
                status.hotel = false;
            else
                status.hotel = true;

            return status;
        }
    }
}
