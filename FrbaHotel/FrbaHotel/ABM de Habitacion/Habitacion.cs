using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.ABM_de_Habitacion
{
    public class Habitacion
    {
        public Int32 id { get; set; }
        public Int32 floor { get; set; }
        public Int32 front { get; set; }
        public Int32 type { get; set; }
        public String typeDescription { get; set; }
        public Int32 hotel { get; set; }
        public String comodity { get; set; }
    }
}
