using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace FrbaHotel.Cancelar_Reserva
{
    public class CancelationBookingHelper
    {
        public static void search(Int32 bookingId, String lastname, DataGridView dgvCancellationBooking)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_cancelacion_reserva_search";

            command.Parameters.Add(new SqlParameter("@p_cancelacion_reserva_id", SqlDbType.Int));
            if (bookingId == 0)
                command.Parameters["@p_cancelacion_reserva_id"].Value = null;
            else
                command.Parameters["@p_cancelacion_reserva_id"].Value = bookingId;

            command.Parameters.Add(new SqlParameter("@p_cancelacion_reserva_lastname", SqlDbType.VarChar, 255));
            command.Parameters["@p_cancelacion_reserva_lastname"].Value = lastname;

            if (VarGlobal.usuario.hotel != 0)
            {
                Int32 hotelId = VarGlobal.usuario.hotel;
                command.Parameters.Add(new SqlParameter("@p_user_hotel_id", SqlDbType.Int));
                command.Parameters["@p_user_hotel_id"].Value = hotelId;
            }

            DataGridViewHelper.fill(command, dgvCancellationBooking);
        }

        public static void cancel(Int32 bookingId, String motive)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_cancelacion_reserva_cancel";

            command.Parameters.Add(new SqlParameter("@p_cancelacion_reserva_id", SqlDbType.Int));
            command.Parameters["@p_cancelacion_reserva_id"].Value = bookingId;

            command.Parameters.Add(new SqlParameter("@p_cancelacion_reserva_motive", SqlDbType.VarChar, 255));
            command.Parameters["@p_cancelacion_reserva_motive"].Value = motive;

            command.Parameters.Add(new SqlParameter("@p_user_name", SqlDbType.VarChar, 255));
            String user = VarGlobal.usuario.id;
            command.Parameters["@p_user_name"].Value = user;

            ProcedureHelper.execute(command, "Se dio de baja la reserva n°: "+ bookingId, true);
        }
    }
}
