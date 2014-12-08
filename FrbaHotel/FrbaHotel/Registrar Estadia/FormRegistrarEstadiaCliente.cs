using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.ABM_de_Habitacion;
using FrbaHotel.ABM_de_Cliente;

namespace FrbaHotel.Registrar_Estadia
{
    public partial class FormRegistrarEstadiaCliente : Form
    {
        private Int32 bookingId { get; set; }
        private Int32 clientId { get; set; }
        public FormRegistrarEstadiaCliente(Int32 bookingId, Int32 clientId)
        {
            InitializeComponent();
            this.bookingId = bookingId;
            this.clientId = clientId;
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            Cliente client = this.getDataFromForm();

            CheckClientHelper.search(client, dgvClient);
        }

        private Cliente getDataFromForm()
        {
            Cliente cliente = new Cliente();
            cliente.name = textBoxName.Text;
            cliente.lastname = textBoxLastName.Text;

            if (textBoxDocumentNumber.Text != String.Empty)
            {
                if (Validaciones.validInt32(textBoxDocumentNumber.Text, "El documento a buscar no es valido, se realiza la busqueda sin filtro"))
                    cliente.documentNumber = Convert.ToInt32(textBoxDocumentNumber.Text);
                else
                    cliente.documentNumber = 0;
            }
            else
            {
                cliente.documentNumber = 0;
            }

            return cliente;
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            textBoxDocumentNumber.Text = "";
            textBoxName.Text = "";
            textBoxLastName.Text = "";
            DataGridViewHelper.clean(dgvClient);
        }

        private void FormRegistrarEstadiaCliente_Load(object sender, EventArgs e)
        {
            this.textBoxBookingId.Text = bookingId.ToString();
            this.textBoxBookingId.Enabled = false;

            Int32 personPerRoom = HabitacionHelper.countPersonPerRoomByBooking(bookingId);
            this.textBoxPersonPerRoom.Text = personPerRoom.ToString();
            this.textBoxPersonPerRoom.Enabled = false;

            createDgvPerson();
        }

        private void createDgvPerson()
        {
            dgvPerson.RowHeadersVisible = false;
            dgvPerson.ReadOnly = true;
            dgvPerson.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvPerson.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvPerson.AllowUserToAddRows = false;
            dgvPerson.ColumnCount = 1;
            dgvPerson.Columns[0].Name = "Id Cliente";
            String[] row = { clientId.ToString() };
            dgvPerson.Rows.Add(row);
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            Boolean isValid = checkIfCountPersonIsCorrect();

            if (isValid)
            {
                isValid = checkIfNotRepeteadClient();
                if (isValid)
                {
                    Int32 stayId = RegisterStayHelper.generateStay(bookingId);

                    RegisterStayHelper.saveStayClients(stayId, getClientsIds());

                    MessageBox.Show("Se ha generado la estadia correctamente", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.closeWindow();
                }
                else
                {
                    MessageBox.Show("Existen numeros de clientes repetidos", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                
            }
        }

        private void closeWindow()
        {
            FormRegistrarEstadia formRegistrarEstadia = new FormRegistrarEstadia();
            formRegistrarEstadia.MdiParent = this.MdiParent;
            MdiParent.Size = formRegistrarEstadia.Size;
            formRegistrarEstadia.Show();
            this.Close();
        }

        private List<Int32> getClientsIds()
        {
            List<Int32> clientIds = new List<Int32>();

            foreach (DataGridViewRow row in dgvPerson.Rows)
            {
                Int32 clientId = Convert.ToInt32(row.Cells[0].Value);
                clientIds.Add(clientId);
            }

            return clientIds;
        }

        private Boolean checkIfNotRepeteadClient()
        {
            List<Int32> clientIds = new List<Int32>();

            foreach (DataGridViewRow row in dgvPerson.Rows)
            {
                Int32 clientId = Convert.ToInt32(row.Cells[0].Value);
                if (clientIds.Contains(clientId))
                {
                    return false;
                }
                else
                {
                    clientIds.Add(clientId);
                }
            }

            return true;
        }

        private Boolean checkIfCountPersonIsCorrect()
        {
            if (dgvPerson.RowCount != Convert.ToInt32(textBoxPersonPerRoom.Text))
            {
                MessageBox.Show("Debe tener igual cantidad de personas agregadas como personas en la habitacion", "", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            return false;
            }
            
            return true;
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            if (dgvClient.CurrentRow != null)
            {
                String[] row = { dgvClient.CurrentRow.Cells[0].Value.ToString() };
                dgvPerson.Rows.Add(row);
            }
            else
            {
                MessageBox.Show("Debe seleccionar un cliente a agregar", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonRemove_Click(object sender, EventArgs e)
        {
            if (dgvPerson.CurrentRow != null)
            {
                if (dgvPerson.CurrentRow.Index != 0)
                {
                    dgvPerson.Rows.RemoveAt(dgvPerson.CurrentRow.Index);
                }
                else
                {
                    MessageBox.Show("El cliente de la reserva no puede ser removido","", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                
            }
        }

        private void buttonAddClient_Click(object sender, EventArgs e)
        {
            FormABMClientModify formABMClientModify = new FormABMClientModify(false, null, this);
            formABMClientModify.MdiParent = this.MdiParent;
            MdiParent.Size = formABMClientModify.Size;
            formABMClientModify.Show();
        }
    }
}
