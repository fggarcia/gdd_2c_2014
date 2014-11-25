using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.ABM_de_Usuario
{
    public class UsuarioDatos
    {
        public string username { get; set; }
        public String nameLastname { get; set; }
        public int typeDocument { get; set; }
        public String typeDocumentDescription { get; set; }
        public int documentNumber { get; set; }
        public String mail { get; set; }
        public String telephone { get; set; }
        public String address { get; set; }
        public DateTime birthDate { get; set; }
        public Boolean enabled { get; set; }
    }
}
