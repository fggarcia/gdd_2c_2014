using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.ABM_de_Cliente
{
    public class Cliente
    {
        public Int32 id { get; set; }
        public String name { get; set; }
        public String lastname { get; set; }
        public Int32 idTypeDocument { get; set; }
        public String typeDocument { get; set; }
        public Int32 documentNumber { get; set; }
        public String mail { get; set; }
        public String telephone { get; set; }
        public String addressName { get; set; }
        public Int32 addressNum { get; set; }
        public Int32 addressFloor { get; set; }
        public String adressDeptName { get; set; }
        public Int32 idNacionality { get; set; }
        public String nacionality { get; set; }
        public DateTime birthdate { get; set; }
        public Boolean enable { get; set; }
    }
}
