using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Hotel
{
    public class Star
    {
        public static void fillComboBox(ComboBox comboBox)
        {
            ComboBoxHelper.fill(comboBox, "LA_MAYORIA.Estrellas e",
                "e.Estrellas", "e.Estrellas", "", null);
        }
    }
}
