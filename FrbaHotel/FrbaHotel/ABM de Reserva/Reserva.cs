using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.ABM_de_Reserva
{
    public class Reserva
    {
        public Int32 id { get; set; }
        public Int32 id_hotel { get; set; }
        public String nombre {get;set;}
        public String apellido { get; set; }
        public DateTime fecha_inicio { get; set; }
        public Int32 tipo_regimen { get; set; }

        

  
    }
   
}
