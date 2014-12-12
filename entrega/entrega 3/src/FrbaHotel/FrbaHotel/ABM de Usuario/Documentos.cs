using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Usuario
{
    public class Documentos
    {
        public static void fillComboBox(ComboBox comboBox)
        {
            ComboBoxHelper.fill(comboBox, "LA_MAYORIA.Tipo_Identificacion ti",
                "ti.Id_Tipo_Identificacion", "ti.Descripcion", null, "ti.Descripcion ASC");
        }
    }
}
