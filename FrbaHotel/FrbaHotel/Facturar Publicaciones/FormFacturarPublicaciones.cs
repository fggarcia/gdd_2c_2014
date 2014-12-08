using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Facturar_Publicaciones
{
    public partial class FormFacturarPublicaciones : Form
    {
        public FormFacturarPublicaciones()
        {
            InitializeComponent();
        }

        private void FormFacturarPublicaciones_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
        }
    }
}
