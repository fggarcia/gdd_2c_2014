using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Reserva
{
    public partial class FormAltaReserva : Form
    {
        public FormAltaReserva()
        {
            InitializeComponent();
        }

        private void FormAltaReserva_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.WindowState = FormWindowState.Maximized;
            ReservaHelper.search_regimen(VarGlobal.usuario.hotel, dgvRegimen);
        }

    
    }
}
