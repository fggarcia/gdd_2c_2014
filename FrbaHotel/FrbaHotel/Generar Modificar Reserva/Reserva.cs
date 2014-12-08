using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.ABM_de_Hotel
{
    public class Hotel
    {
        public Int32 id { get; set; }
        public String name { get; set; }
        public String mail { get; set; }
        public String telephone { get; set; }
        public String address { get; set; }
        public Int32 addressNumber { get; set; }
        public String city { get; set; }
        public String country { get; set; }
        public Int32 star { get; set; }
        public DateTime creation { get; set; }
        
    }
}
