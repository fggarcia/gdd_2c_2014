using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.Generar_Modificar_Reserva
{
    public class Reserva
    {
        public Int32 id { get; set; }
        public Int32 id_hotel { get; set; }
        public DateTime fecha_inicio { get; set; }
        public Int32 tipo_regimen { get; set; }
        
    }
}
