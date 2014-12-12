using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Habitacion
{
    public class TypeRoom
    {
        public static void fillComboBox(ComboBox comboBox)
        {
            ComboBoxHelper.fill(comboBox, "LA_MAYORIA.Tipo_Habitacion th",
                "th.Id_Tipo_Habitacion", "th.Descripcion", "", null);
        }
    }
}
