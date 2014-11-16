using System;
namespace FrbaHotel
{
    public class DateConverter
    {
        public static DateTime convertirFecha(string dia, string mes, string anio)
        {
            DateTime fecha = new DateTime(Convert.ToInt32(anio), Convert.ToInt32(mes), Convert.ToInt32(dia), 00, 00, 00, 000);
            return fecha;
        }
    }
}