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

            command.Parameters.AddWithValue("@p_stay_booking_id", bookingId);

            command.Parameters.AddWithValue("@p_stay_hotel_id", VarGlobal.usuario.hotel);

            DataGridViewHelper.fill(command, dgvRegisterStay);
        }

        public static BookingStatus bookingStatus(Int32 bookingId)
        {
            BookingStatus status = new BookingStatus();

            status.before = isBefore(bookingId);
            status.cancel = isCancel(bookingId);
            status.exist = isExist(bookingId);
            status.hotel = isHotel(bookingId);

            return status;
        }

        public static Boolean isExist(Int32 bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_booking_is_exist";

            command.Parameters.AddWithValue("@p_stay_booking_id", bookingId);
            command.Parameters.AddWithValue("@p_stay_hotel_id", VarGlobal.usuario.hotel);

            var returnParameterExist = command.Parameters.Add(new SqlParameter("@p_stay_booking_exist", SqlDbType.Bit));
            returnParameterExist.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "check if booking exist", false);

            Int16 isExist = Convert.ToInt16(returnParameterExist.Value);

            if (isExist != 0)
                return true;
            else
                return false;
        }

        public static Boolean isCancel(Int32 bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_booking_is_cancel";

            command.Parameters.AddWithValue("@p_stay_booking_id", bookingId);
            command.Parameters.AddWithValue("@p_stay_hotel_id", VarGlobal.usuario.hotel);

            var returnParameterCancel = command.Parameters.Add(new SqlParameter("@p_stay_booking_cancel", SqlDbType.Bit));
            returnParameterCancel.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "check if booking cancel", false);

            Int16 isCancel = Convert.ToInt16(returnParameterCancel.Value);

            if (isCancel != 0)
                return true;
            else
                return false;
        }

        public static Boolean isBefore(Int32 bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_booking_is_before";

            command.Parameters.AddWithValue("@p_stay_booking_id", bookingId);
            command.Parameters.AddWithValue("@p_stay_hotel_id", VarGlobal.usuario.hotel);

            var returnParameterBefore = command.Parameters.Add(new SqlParameter("@p_stay_booking_before", SqlDbType.Bit));
            returnParameterBefore.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "check if booking before", false);

            Int16 isBefore = Convert.ToInt16(returnParameterBefore.Value);

            if (isBefore != 0)
                return true;
            else
                return false;
        }

        public static Boolean isHotel(Int32 bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_booking_is_hotel";

            command.Parameters.AddWithValue("@p_stay_booking_id", bookingId);
            command.Parameters.AddWithValue("@p_stay_hotel_id", VarGlobal.usuario.hotel);

            var returnParameterHotel = command.Parameters.Add(new SqlParameter("@p_stay_booking_hotel", SqlDbType.Bit));
            returnParameterHotel.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "check if booking is in this hotel", false);

            Int16 isHotel = Convert.ToInt16(returnParameterHotel.Value);

            if (isHotel != 0)
                return true;
            else
                return false;
        }

        public static void generateStay(int bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_estadia_generate_stay";

            command.Parameters.AddWithValue("@p_stay_booking_id", bookingId);
            command.Parameters.AddWithValue("@p_stay_user_name", VarGlobal.usuario.id);

            ProcedureHelper.execute(command, "generate stay", false);
        }
    }
}
