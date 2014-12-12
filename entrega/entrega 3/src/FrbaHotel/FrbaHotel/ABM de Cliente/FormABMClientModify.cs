using System;
using System.Windows.Forms;
using FrbaHotel.ABM_de_Usuario;

namespace FrbaHotel.ABM_de_Cliente
{
    public partial class FormABMClientModify : Form
    {
        private String client { get; set; }
        private Boolean edit { get; set; }
        private Form from;

        public FormABMClientModify(Boolean edit, String client, Form from)
        {
            this.edit = edit;
            this.client = client;
            this.from = from;
            InitializeComponent();
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.closeWindow();
        }

        private void closeWindow()
        {
            if (from != null)
            {
                from.MdiParent = this.MdiParent;
                MdiParent.Size = from.Size;
                this.Close();
                from.Show();
            }
            else
            {
                FormABMClient formABMClient = new FormABMClient();
                formABMClient.MdiParent = this.MdiParent;
                MdiParent.Size = formABMClient.Size;
                this.Close();
                formABMClient.Show();
            }
        }

        private void buttonAccept_Click(object sender, EventArgs e)
        {
            Cliente clientData = this.getDataFromForm();
            if (clientData != null)
            {
                Boolean existEqualTypeAndDocumentNumber = ClienteHelper.checkTypeAndDocumentNumber(clientData.id, 
                    clientData.typeDocument, clientData.documentNumber);
                if (existEqualTypeAndDocumentNumber)
                {
                    DialogResult dialogDocument = MessageBox.Show("Existe ya un usuario con ese tipo de documento y numero. Desea continuar igual?",
                        "Mensaje importante", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dialogDocument != DialogResult.Yes)
                    {
                        return;        
                    }
                }

                Boolean existAnEqualMail = ClienteHelper.checkMail(clientData.id, clientData.mail);
                if (existAnEqualMail)
                {
                    DialogResult dialogMail = MessageBox.Show("Existe ya un usuario con ese mail. Desea continuar igual?",
                        "Mensaje importante", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dialogMail != DialogResult.Yes)
                    {
                        return;
                    }
                }

                this.saveOrUpdateClient(clientData);
            }
        }

        private void saveOrUpdateClient(Cliente clientData)
        {
            Int32 clientId = ClienteHelper.save(clientData);
            this.client = clientId.ToString();
            if (edit)
            {
                MessageBox.Show("Modificacion de cliente realizada con exito");
            }
            else
            {
                MessageBox.Show("Creacion de cliente realizada con exito");
            }
            this.closeWindow();
        }

        private void FormABMClientModify_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            Documentos.fillComboBox(comboBoxDocumentType);
            Nacionalidad.fillComboBox(comboBoxNationality);

            if (edit)
            {
                Cliente clientData = ClienteHelper.getClientData(client);
                

                this.textBoxName.Text = clientData.name;
                this.textBoxLastname.Text = clientData.lastname;
                this.comboBoxDocumentType.SelectedIndex = this.comboBoxDocumentType.FindStringExact(clientData.typeDocument);
                this.textBoxDocumentNumber.Text = clientData.documentNumber.ToString();
                this.textBoxMail.Text = clientData.mail;
                this.textBoxTelephone.Text = clientData.telephone;
                this.textBoxAddress.Text = clientData.addressName;
                this.textBoxAddressNumber.Text = clientData.addressNum.ToString();
                this.textBoxAddressFloor.Text = clientData.addressFloor.ToString();
                this.textBoxAddressDept.Text = clientData.adressDeptName;
                this.comboBoxNationality.SelectedIndex = this.comboBoxNationality.FindStringExact(clientData.nacionality);
                this.dtBrithdate.Value = clientData.birthdate;
            }
        }

        private Cliente getDataFromForm()
        {
            Cliente clientData = new Cliente();

            if (client != null || client != "")
            {
                clientData.id = Convert.ToInt32(client);
            }
            else
            {
                clientData.id = 0;
            }

            
            Boolean isValid;
            isValid = Validaciones.requiredString(textBoxName.Text, "El nombre es necesario");
            if (isValid)
                clientData.name = textBoxName.Text;
            else
                return null;

            isValid = Validaciones.requiredString(textBoxLastname.Text, "El apellido es necesario");
            if (isValid)
                clientData.lastname = textBoxLastname.Text;
            else
                return null;

            isValid = Validaciones.requiredString(comboBoxDocumentType.Text.ToString(), "El tipo de documento es necesario");
            if (isValid)
                clientData.typeDocument = comboBoxDocumentType.Text.ToString();
            else
                return null;

            isValid = Validaciones.validAndRequiredInt32MoreThan0(textBoxDocumentNumber.Text, "El numero de telefono es requerido");
            if (isValid)
                clientData.documentNumber = Convert.ToInt32(textBoxDocumentNumber.Text);
            else
                return null;

            isValid = Validaciones.validAndRequiredMail(textBoxMail.Text, "El mail debe ser valido");
            if (isValid)
                clientData.mail = textBoxMail.Text;
            else
                return null;

            isValid = Validaciones.validAndRequiredInt32MoreThan0(textBoxTelephone.Text, "El telefono debe ser numerico");
            if (isValid)
                clientData.telephone = textBoxTelephone.Text;
            else
                return null;

            isValid = Validaciones.requiredString(textBoxAddress.Text, "La direccion es obligatoria");
            if (isValid)
                clientData.addressName = textBoxAddress.Text;
            else
                return null;

            isValid = Validaciones.validAndRequiredInt32(textBoxAddressNumber.Text, "El numero de la direccion es obligatorio");
            if (isValid)
                clientData.addressNum = Convert.ToInt32(textBoxAddressNumber.Text);
            else
                return null;

            if (textBoxAddressFloor.Text != "" && textBoxAddressFloor.Text != String.Empty)
            {
                isValid = Validaciones.validAndRequiredInt32(textBoxAddressFloor.Text, "El piso debe ser numerico");
                clientData.addressFloor = Convert.ToInt32(textBoxAddressFloor.Text);
                clientData.adressDeptName = textBoxAddressDept.Text;
            }
            else
            {
                if (textBoxAddressDept.Text != "" && textBoxAddressFloor.Text != String.Empty)
                {
                    MessageBox.Show("Si completa el nombre de deparmento debe colocar un piso");
                    return null;
                }
                clientData.addressFloor = VarGlobal.NoAddressFloor;
                clientData.adressDeptName = null;
            }

            isValid = Validaciones.requiredString(this.comboBoxNationality.Text.ToString(), "debe seleccionar un tipo de nacionalidad");
            if (isValid)
                clientData.nacionality = this.comboBoxNationality.Text.ToString();
            else
                return null;

            DateTime birthdate = dtBrithdate.Value;

            DateHelper.truncate(birthdate);
            clientData.birthdate = birthdate;

            return clientData;
        }
    }
}
