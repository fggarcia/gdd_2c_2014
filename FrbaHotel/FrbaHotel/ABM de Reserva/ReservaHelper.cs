using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using FrbaHotel.ABM_de_Reserva;


namespace FrbaHotel.ABM_de_Reserva
{
    public class ReservaHelper
    {
        public static void search(Reserva reserva, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            
            command.CommandText = "LA_MAYORIA.sp_reserva_listar";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = reserva.id_hotel;
            
            command.Parameters.Add(new SqlParameter("@p_nombre", SqlDbType.VarChar,255));

            if (reserva.nombre == string.Empty)
                command.Parameters["@p_nombre"].Value = null;
            else
                command.Parameters["@p_nombre"].Value = reserva.nombre;


            command.Parameters.Add(new SqlParameter("@p_apellido", SqlDbType.VarChar, 255));

           if (reserva.apellido == string.Empty)
                command.Parameters["@p_apellido"].Value = null;
            else
                command.Parameters["@p_apellido"].Value = reserva.apellido;

            /*command.Parameters.Add(new SqlParameter("@p_res_id", SqlDbType.Int));
            command.Parameters["@p_res_id"].Value = reserva.id;*/

            DataGridViewHelper.fill(command, dgvReserva);
        }

        public static void search_regimen(Int32 hotel, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_hotel_regimen_retrieve";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = VarGlobal.usuario.hotel;

            DataGridViewHelper.fill(command, dgvReserva);
        }

        public static void search_tipo_hab(Int32 hotel, DataGridView dgvReserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_tipo_habitacion_available";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = VarGlobal.usuario.hotel;

            DataGridViewHelper.fill(command, dgvReserva);
        }

        public static int search_occupied(Reserva reserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_reserva_occupied";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = reserva.id_hotel;
            command.Parameters.Add(new SqlParameter("@p_tipo_hab", SqlDbType.VarChar,255));
            command.Parameters["@p_tipo_hab"].Value = reserva.tipo_habitacion;
            command.Parameters.Add(new SqlParameter("@p_fecha_desde", SqlDbType.DateTime));
            command.Parameters["@p_fecha_desde"].Value = reserva.fecha_inicio;
            command.Parameters.Add(new SqlParameter("@p_fecha_hasta", SqlDbType.DateTime));
            command.Parameters["@p_fecha_hasta"].Value = reserva.fecha_fin;
            var returnParameter_occupied = command.Parameters.Add(new SqlParameter("@p_total", SqlDbType.Int));
            returnParameter_occupied.Direction = ParameterDirection.Output;
            ProcedureHelper.execute(command, "chequear ocupacion hotel", false);
            int ocupacion = Convert.ToInt16(command.Parameters["@p_total"].Value);
            return ocupacion;
        }

        public static int search_reserva_availability(Reserva reserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.check_availability";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = reserva.id_hotel;
            command.Parameters.Add(new SqlParameter("@p_tipo_habitacion", SqlDbType.VarChar, 255));
            command.Parameters["@p_tipo_habitacion"].Value = reserva.tipo_habitacion;
            var returnParameter_occupied = command.Parameters.Add(new SqlParameter("@p_total", SqlDbType.Int));
            returnParameter_occupied.Direction = ParameterDirection.Output;
            ProcedureHelper.execute(command, "chequear total habitaciones de un tipo", false);
            int cantidad = Convert.ToInt16(command.Parameters["@p_total"].Value);
            return cantidad;
        }

        public static int check_hotel_availability(Reserva reserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_check_hotel_availability";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = reserva.id_hotel;
            command.Parameters.Add(new SqlParameter("@p_checkin", SqlDbType.DateTime));
            command.Parameters["@p_checkin"].Value = reserva.fecha_inicio;
            command.Parameters.Add(new SqlParameter("@p_stay", SqlDbType.Int));
            command.Parameters["@p_stay"].Value =Convert.ToInt16((reserva.fecha_fin.Subtract(reserva.fecha_inicio)).Days);
            var returnParameter_availability = command.Parameters.Add(new SqlParameter("@p_availability", SqlDbType.Int));
            returnParameter_availability.Direction = ParameterDirection.Output;
            ProcedureHelper.execute(command, "chequear total habitaciones de un tipo", false);
            int availability = Convert.ToInt16(returnParameter_availability.Value);
            return availability;
        }

        public static void search_reserva(Reserva reserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_get_reserva";

            command.Parameters.Add(new SqlParameter("@p_id_reserva", SqlDbType.Int));
            command.Parameters["@p_id_reserva"].Value = reserva.id;

            var returnParameter_regimen = command.Parameters.Add(new SqlParameter("@p_regimen", SqlDbType.VarChar,255));
            returnParameter_regimen.Direction = ParameterDirection.Output;
            var returnParameter_fecha_desde = command.Parameters.Add(new SqlParameter("@p_fecha_desde", SqlDbType.DateTime));
            returnParameter_fecha_desde.Direction = ParameterDirection.Output;
            var returnParameter_estadia = command.Parameters.Add(new SqlParameter("@p_estadia", SqlDbType.Int));
            returnParameter_estadia.Direction = ParameterDirection.Output;
            var returnParameter_estado = command.Parameters.Add(new SqlParameter("@p_estado", SqlDbType.VarChar,255));
            returnParameter_estado.Direction = ParameterDirection.Output;
            var returnParameter_nro_hab = command.Parameters.Add(new SqlParameter("@p_nro_hab", SqlDbType.Int));
            returnParameter_nro_hab.Direction = ParameterDirection.Output;
            var returnParameter_piso_hab = command.Parameters.Add(new SqlParameter("@p_piso_hab", SqlDbType.Int));
            returnParameter_piso_hab.Direction = ParameterDirection.Output;
            var returnParameter_tipo_hab = command.Parameters.Add(new SqlParameter("@p_tipo_hab", SqlDbType.VarChar,255));
            returnParameter_tipo_hab.Direction = ParameterDirection.Output;

            ProcedureHelper.execute(command, "buscar reserva", false);
            reserva.tipo_regimen = Convert.ToString(command.Parameters["@p_regimen"].Value);
            reserva.fecha_inicio = Convert.ToDateTime(command.Parameters["@p_fecha_desde"].Value);
            reserva.estadia = Convert.ToInt16(command.Parameters["@p_estadia"].Value);
            reserva.estado = Convert.ToString(command.Parameters["@p_estado"].Value);
            reserva.piso_hab  = Convert.ToInt16(command.Parameters["@p_piso_hab"].Value);
            reserva.nro_hab = Convert.ToInt16(command.Parameters["@p_nro_hab"].Value);
            reserva.tipo_habitacion = Convert.ToString(command.Parameters["@p_tipo_hab"].Value);       
        }

        public static void update_reserva(Reserva reserva)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_assign_room";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = reserva.id_hotel;
            command.Parameters.Add(new SqlParameter("@p_id_usuario", SqlDbType.VarChar,20));
            command.Parameters["@p_id_usuario"].Value = VarGlobal.usuario.id;
            //command.Parameters.Add(new SqlParameter("@p_checkin", SqlDbType.DateTime));
            //command.Parameters["@p_checkin"].Value = reserva.fecha_inicio;
            command.Parameters.AddWithValue("@p_checkin", reserva.fecha_inicio);
            command.Parameters.Add(new SqlParameter("@p_id_reserva", SqlDbType.Int));
            command.Parameters["@p_id_reserva"].Value = reserva.id;
            command.Parameters.Add(new SqlParameter("@p_stay", SqlDbType.Int));
            Int32 days = Convert.ToInt32((reserva.fecha_fin- reserva.fecha_inicio).TotalDays);
            command.Parameters["@p_stay"].Value = days;
            command.Parameters.Add(new SqlParameter("@p_tipo_habitacion", SqlDbType.VarChar,255));
            command.Parameters["@p_tipo_habitacion"].Value = reserva.tipo_habitacion;
            command.Parameters.Add(new SqlParameter("@p_regimen", SqlDbType.VarChar, 255));
            command.Parameters["@p_regimen"].Value = reserva.tipo_regimen;
            command.Parameters.Add(new SqlParameter("@p_update", SqlDbType.Bit));
            command.Parameters["@p_update"].Value = 1;

            ProcedureHelper.execute(command, "update reserva", false);

            MessageBox.Show("Los cambios fueron guardados");

        }

        public static void fillHotel(ComboBox comboHotel)
        {
            ComboBoxHelper.fill(comboHotel, "LA_MAYORIA.Hotel h",
                "h.Id_Hotel", "h.Id_Hotel", null, null);
        }

        public static void reservar(Reserva reserva)
        {
           
            
            SqlCommand command = new SqlCommand();
            command.CommandText = "LA_MAYORIA.sp_assign_room";

            command.Parameters.Add(new SqlParameter("@p_hotel_id", SqlDbType.Int));
            command.Parameters["@p_hotel_id"].Value = reserva.id_hotel;
            command.Parameters.Add(new SqlParameter("@p_id_usuario", SqlDbType.VarChar, 20));
            command.Parameters["@p_id_usuario"].Value = VarGlobal.usuario.id;
            command.Parameters.Add(new SqlParameter("@p_client_id", SqlDbType.Int));
            command.Parameters["@p_client_id"].Value = reserva.clienteId;
            //command.Parameters.Add(new SqlParameter("@p_checkin", SqlDbType.DateTime));
            //command.Parameters["@p_checkin"].Value = reserva.fecha_inicio;
            command.Parameters.AddWithValue("@p_checkin", reserva.fecha_inicio);
            command.Parameters.Add(new SqlParameter("@p_id_reserva", SqlDbType.Int));
            command.Parameters["@p_id_reserva"].Value = reserva.id;
            command.Parameters.Add(new SqlParameter("@p_stay", SqlDbType.Int));
            Int32 days = Convert.ToInt32((reserva.fecha_fin - reserva.fecha_inicio).TotalDays);
            command.Parameters["@p_stay"].Value = days;
            command.Parameters.Add(new SqlParameter("@p_tipo_habitacion", SqlDbType.VarChar, 255));
            command.Parameters["@p_tipo_habitacion"].Value = reserva.tipo_habitacion;
            command.Parameters.Add(new SqlParameter("@p_regimen", SqlDbType.VarChar, 255));
            command.Parameters["@p_regimen"].Value = reserva.tipo_regimen;
            command.Parameters.Add(new SqlParameter("@p_update", SqlDbType.Bit));
            command.Parameters["@p_update"].Value = 0;

            ProcedureHelper.execute(command, "update reserva", false);

            MessageBox.Show("Los cambios fueron guardados");

        }
      
      }
}
