using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.ABM_de_Consumibles;

namespace FrbaHotel.Registrar_Consumible
{
    public partial class FormRegistrarConsumibles : Form
    {
        private String idUser;
        private Int32 idEstadia;

        public FormRegistrarConsumibles()
        {
            InitializeComponent();
        }

        public FormRegistrarConsumibles(String idUser, Int32 idEstadia)
        {
            InitializeComponent();
            this.idUser = idUser;
            this.idEstadia = idEstadia;
        }


        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.closeWindow();
        }

        private void closeWindow()
        {
           FormABMConsumibles formABMConsumibles = new FormABMConsumibles();
           formABMConsumibles.MdiParent = this.MdiParent;
           MdiParent.Size = formABMConsumibles.Size;
           this.Close();
           formABMConsumibles.Show();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (dgvConsumiblesList.CurrentRow != null)
            {
                Boolean isValid;
                isValid = Validaciones.validAndRequiredInt32MoreThanEqual0(txtCantidad.Text," Debe Ingresar una cantidad mayor a 0");

                if (isValid)
                {
                    Consumible c = new Consumible();
                    c.id = Convert.ToInt32(dgvConsumiblesList.CurrentRow.Cells[0].Value);
                    c.cantidad = int.Parse(txtCantidad.Text);

                    ConsumiblesFuncionalityHelper.addConsumibleToEstadia(this.idUser, this.idEstadia, c);
                    
                    MessageBox.Show("Se agrego el consumible correctamente");
                    txtCantidad.Text = "";

                    reloadGrid();
                }                
            }
            else
            {
                MessageBox.Show("Debe seleccionar un consumible a agregar ");
            }
        }

        private void btnRemove_Click(object sender, EventArgs e)
        {
            if (dgvSelected.CurrentRow != null)
            {
                Int32 idConsumible = Convert.ToInt32(dgvSelected.CurrentRow.Cells[0].Value);
                ConsumiblesFuncionalityHelper.removeConsumibleToEstadia(this.idEstadia, idConsumible);
                MessageBox.Show("Se quito el consumible correctamente");
                reloadGrid();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un consumible a remover ");
            }
        }


        private void btnFilter_Click(object sender, EventArgs e)
        {
            ConsumiblesFuncionalityHelper.getConsumibleByFilter(txtConsumibles.Text, this.dgvConsumiblesList);
        }

        private void FormRegistrarConsumibles_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            reloadGrid();
        }

        private void reloadGrid()
        {
            ConsumiblesFuncionalityHelper.getConsumibleByFilter(txtConsumibles.Text, this.dgvConsumiblesList);
            ConsumiblesFuncionalityHelper.getConsumibleByEstadia(idEstadia, this.dgvSelected);
            //this.dgvConsumiblesList.Columns["id"].Visible = false;
            //this.dgvSelected.Columns["id"].Visible = false;
        }
    }
}
