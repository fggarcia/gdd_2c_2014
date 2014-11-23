using System.Windows.Forms;
using System;
using System.Data.SqlClient;
using System.Data;

namespace FrbaHotel.Login
{
    public partial class Form_Seleccion_Rol : Form
    {
        Usuario user;

        public Form_Seleccion_Rol(Usuario user)
        {
            InitializeComponent();
            //ComboBoxHelper.fillFromProcedure(comboBox_Roles, sp_rol_by_user, "Value", "Display");
            ComboBoxHelper.fill(comboBox_Roles, "LA_MAYORIA.Usuario_Rol ur INNER JOIN LA_MAYORIA.Rol r ON ur.Id_Rol = r.Id_Rol",
                "ur.Id_Rol", "Descripcion", "ur.Id_Usuario = '" + user.id +"' AND ur.Habilitado = 1 AND ur.Habilitado = 1", null);
        }
    }
}
