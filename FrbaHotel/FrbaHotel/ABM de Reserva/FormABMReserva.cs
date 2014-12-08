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
    public partial class FormABMReserva : Form
    {
        public FormABMReserva()
        {
            InitializeComponent();
        }

        private void FormABMReserva_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
            ReservaHelper.search(VarGlobal.usuario.hotel, dgvReserva);
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {

        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
 
    }
}
