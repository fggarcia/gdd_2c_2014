using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Cliente
{
    public partial class FormABMClient : Form
    {
        public FormABMClient()
        {
            InitializeComponent();
        }

        private void FormABMCliente_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            TextBoxHelper.clean(this);
            TypeDocument.fillComboBox(comboTypeDocument);
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonEnable_Click(object sender, EventArgs e)
        {
            if (dgvClient.CurrentRow != null)
            {
                ClienteHelper.enable(Convert.ToInt32(dgvClient.CurrentRow.Cells[0].Value), true);
                buttonSearch.PerformClick();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un cliente a habilitar");
            }
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            TextBoxHelper.clean(this);
            DataGridViewHelper.clean(dgvClient);
            TypeDocument.fillComboBox(comboTypeDocument);
        }

        private void buttonDisable_Click(object sender, EventArgs e)
        {
            if (dgvClient.CurrentRow != null)
            {
                ClienteHelper.enable(Convert.ToInt32(dgvClient.CurrentRow.Cells[0].Value), false);
                buttonSearch.PerformClick();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un cliente a deshabilitar");
            }
        }

        private void buttonEdit_Click(object sender, EventArgs e)
        {
            if (dgvClient.CurrentRow != null)
            {
                //FormABMClientModify formABMClientModify = new FormABMClientModify(true, dgvClient.CurrentRow.Cells[0].Value.ToString());
                //formABMUsuarioModify.MdiParent = this.MdiParent;
                //MdiParent.Size = formABMUsuarioModify.Size;
                //formABMUsuarioModify.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un usuario a modificar");
            }
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            Cliente clientToSearch = this.getDataToSearch();
            ClienteHelper.search(clientToSearch, dgvClient);
        }

        private Cliente getDataToSearch()
        {
            Cliente cliente = new Cliente();
            cliente.name = textBoxName.Text;
            cliente.lastname = textBoxLastname.Text;

            if (comboTypeDocument.SelectedValue.ToString() != String.Empty)
            {
                cliente.idTypeDocument = Convert.ToInt32(comboTypeDocument.SelectedValue.ToString());
            }
            else
            {
                cliente.idTypeDocument = 0;
            }
            cliente.typeDocument = comboTypeDocument.SelectedText;
            if (textBoxDocumentNumber.Text != String.Empty)
            {
                if (Validaciones.validInt32(textBoxDocumentNumber.Text, "El documento a buscar no es valido, se realiza la busqueda sin filtro"))
                    cliente.documentNumber = Convert.ToInt32(textBoxDocumentNumber.Text);
                else
                    cliente.documentNumber = 0;
            }else
            {
                cliente.documentNumber = 0;
            }
            
            cliente.mail = textBoxMail.Text;

            return cliente;
        }

        private void dgvClient_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void buttonCreate_Click(object sender, EventArgs e)
        {

        }

        private void textBoxMail_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblMail_Click(object sender, EventArgs e)
        {

        }

        private void textBoxDocumentNumber_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblDocumentNumber_Click(object sender, EventArgs e)
        {

        }

        private void comboTypeDocument_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lblTypeDocument_Click(object sender, EventArgs e)
        {

        }

        private void textBoxLastname_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblLastname_Click(object sender, EventArgs e)
        {

        }

        private void textBoxName_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblName_Click(object sender, EventArgs e)
        {

        }
    }
}
