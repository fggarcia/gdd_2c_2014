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
        public DateTime fecha_fin { get; set; }
        public Int32 estadia { get; set; }
        public String tipo_habitacion { get; set; }
        public Int32 nro_hab { get; set; }
        public Int32 piso_hab { get; set; }
        public String tipo_regimen { get; set; }
        public String estado { get; set; }

  
    }
   
}
