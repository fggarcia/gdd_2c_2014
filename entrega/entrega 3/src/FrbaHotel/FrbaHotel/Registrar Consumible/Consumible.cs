using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaHotel.ABM_de_Consumibles
{
    public class Consumible
    {
        public int id { get; set; }
        public string description { get; set; }
        public double precio { get; set; }
        public int cantidad { get; set; }

        public Consumible()
        {
        }

        public Consumible(int id, string description, double precio, int cantidad)
        {
            this.id = id;
            this.description = description;
            this.precio = precio;
            this.cantidad = cantidad;
        }
    }
}