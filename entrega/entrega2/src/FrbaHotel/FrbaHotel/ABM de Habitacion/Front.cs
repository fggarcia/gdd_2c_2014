using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Habitacion
{
    public class Front
    {
        public static void fillComboBox(ComboBox comboBox)
        {
            ComboBoxHelper.fill(comboBox, "LA_MAYORIA.FRENTE f",
                "f.Id_Frente", "f.Descripcion", "", null);
        }
    }
}
