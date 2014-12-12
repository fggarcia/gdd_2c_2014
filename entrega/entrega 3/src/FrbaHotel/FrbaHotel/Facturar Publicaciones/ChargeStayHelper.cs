using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using FrbaHotel.Registrar_Estadia;
using System.Data;

namespace FrbaHotel.Facturar_Publicaciones
{
    public class ChargeStayHelper
    {
        public static void search(Int32 bookingId, DataGridView dgvStay)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_facturar_estadia_booking_search";

            command.Parameters.AddWithValue("@p_charge_stay_booking_id", bookingId);

            command.Parameters.AddWithValue("@p_charge_stay_hotel_id", VarGlobal.usuario.hotel);

            DataGridViewHelper.fill(command, dgvStay);
        }

        public static StayStatus getStatus(Int32 bookingId)
        {
            StayStatus status = new StayStatus();

            status.isCheckIn = isCheckIn(bookingId);
            status.isExist = isExist(bookingId);
            status.isHotel = RegisterStayHelper.isHotel(bookingId);
            status.wasCharged = wasCharged(bookingId);

            return status;
        }

        private static Boolean isCheckIn(Int32 bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_facturar_estadia_is_check_in";

            command.Parameters.AddWithValue("@p_charge_stay_booking_id", bookingId);

            var returnParameterIsCheckIn = command.Parameters.Add(new SqlParameter("@p_charge_stay_is_check_in", SqlDbType.Bit));
            returnParameterIsCheckIn.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "check if check in exist", false);

            Int16 isCheckIn = Convert.ToInt16(returnParameterIsCheckIn.Value);

            if (isCheckIn != 0)
                return true;
            else
                return false;
        }

        private static Boolean isExist(Int32 bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_facturar_estadia_is_exist";

            command.Parameters.AddWithValue("@p_charge_stay_booking_id", bookingId);

            var returnParameterIsExist = command.Parameters.Add(new SqlParameter("@p_charge_stay_is_exist", SqlDbType.Bit));
            returnParameterIsExist.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "check if stay exist", false);

            Int16 isExist = Convert.ToInt16(returnParameterIsExist.Value);

            if (isExist != 0)
                return true;
            else
                return false;
        }

        private static Boolean wasCharged(Int32 bookingId)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_facturar_estadia_was_charged";

            command.Parameters.AddWithValue("@p_charge_stay_booking_id", bookingId);

            var returnParameterWasCharge = command.Parameters.Add(new SqlParameter("@p_charge_stay_was_charged", SqlDbType.Bit));
            returnParameterWasCharge.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(command, "check if stay was charged", false);

            Int16 wasCharged = Convert.ToInt16(returnParameterWasCharge.Value);

            if (wasCharged != 0)
                return true;
            else
                return false;
        }

        public static void loadCharge(Int32 stayId, DataGridView dgvLoadCharge)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_facturar_estadia_get_charge";

            command.Parameters.AddWithValue("@p_charge_stay_stay_id", stayId);

            DataGridViewHelper.fill(command, dgvLoadCharge);
        }

        public static void charge(Int32 stayId, Int32 clientId,String typePay, Int32 numberCard)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_facturar_estadia_charge";

            command.Parameters.AddWithValue("@p_charge_stay_stay_id", stayId);
            command.Parameters.AddWithValue("@p_charge_stay_client_id", clientId);
            command.Parameters.AddWithValue("@p_charge_stay_number_card", numberCard);
            command.Parameters.AddWithValue("@p_charge_stay_type_pay", typePay);

            ProcedureHelper.execute(command, "set charge", false);
        }
    }
}
