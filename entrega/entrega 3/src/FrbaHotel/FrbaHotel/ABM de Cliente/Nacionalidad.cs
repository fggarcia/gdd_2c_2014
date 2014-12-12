using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Cliente
{
    public class Nacionalidad
    {
        public static void fillComboBox(ComboBox comboBox)
        {
            ComboBoxHelper.fill(comboBox, "LA_MAYORIA.Nacionalidad n",
                "n.Id_Nacionalidad", "n.Descripcion", null, "n.Descripcion ASC");
        }
    }
}
