using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FrbaHotel.ABM_de_Rol;

namespace FrbaHotel
{
    public class Usuario
    {
        public string id { get; set; }
        public Rol rol { get; set; }
        public int hotel { get; set; }
    }
}
