using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Facturar_Publicaciones
{
    public class TypePay
    {
        public static void fillComboBox(ComboBox comboBox)
        {
            ComboBoxHelper.fill(comboBox, "LA_MAYORIA.Tipo_Pago",
                "Id_Tipo_Pago", "Descripcion", "", null);
        }
    }
}
