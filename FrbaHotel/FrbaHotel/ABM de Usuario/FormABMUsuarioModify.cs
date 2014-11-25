using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.ABM_de_Rol;
using FrbaHotel.Hotel;

namespace FrbaHotel.ABM_de_Usuario
{
    public partial class FormABMUsuarioModify : Form
    {
        private Boolean edit;
        private String user;

        public FormABMUsuarioModify(Boolean edit, String user)
        {
            InitializeComponent();
            this.edit = edit;
            this.user = user;
        }

        private void FormABMUsuarioModify_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;

            Roles.fillComboBox(comboBoxRol);
            Documentos.fillComboBox(comboBoxDocumentType);

            if (edit)
            {
                UsuarioDatos userData = UsuarioDatosHelper.getUserData(user);
                this.txtAddress.Text = userData.address;
                this.txtDocumentNumber.Text = userData.documentNumber.ToString();
                this.txtMail.Text = userData.mail;
                this.txtNameLastname.Text = userData.nameLastname;
                this.txtPassword.Enabled = false;
                this.txtTelephone.Text = userData.telephone;
                this.txtUsername.Text = userData.username;
                this.txtUsername.Enabled = false;
                this.comboBoxDocumentType.SelectedIndex = this.comboBoxDocumentType.FindStringExact(userData.typeDocumentDescription);
                this.checkBoxEnable.Checked = userData.enabled;

                this.dtBirthDate.Value = userData.birthDate;

                Rol rolUsuario = UsuarioHelper.getRolByUserHotel(user, VarGlobal.usuario.hotel);
                this.comboBoxRol.SelectedIndex = this.comboBoxRol.FindStringExact(rolUsuario.description);
            }
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.closeWindow();
        }

        private void closeWindow()
        {
            FormABMUsuario formABMUsuario = new FormABMUsuario();
            formABMUsuario.MdiParent = this.MdiParent;
            MdiParent.Size = formABMUsuario.Size;
            this.Close();
            formABMUsuario.Show();
        }

        private void buttonCleanLogin_Click(object sender, EventArgs e)
        {
            UsuarioHelper.cleanLogin(txtUsername.Text.ToString());
            MessageBox.Show("Se reinicio contador de login");
        }

        private void buttonAccept_Click(object sender, EventArgs e)
        {
            UsuarioDatos userData = this.getDataFromForm();
            Int32 idRol = 0;
            if (userData != null)
            {
                if (txtPassword.Text != "" || edit)
                    if (Validaciones.requiredString(comboBoxRol.SelectedValue.ToString(), "Un rol debe ser seleccionado"))
                    {
                        idRol = Convert.ToInt32(comboBoxRol.SelectedValue.ToString());
                        UsuarioDatosHelper.save(userData, VarGlobal.usuario.hotel, idRol, txtPassword.Text);
                    }
            }
        }

        private UsuarioDatos getDataFromForm()
        {
            UsuarioDatos userData = new UsuarioDatos();
            Boolean isValid;
            isValid = Validaciones.requiredString(txtAddress.Text, "La direccion es necesaria");
            if (isValid)
                userData.address = txtAddress.Text;
            else
                return null;

            isValid = Validaciones.validAndRequiredInt32(txtDocumentNumber.Text, "El numero de documento debe ser numerico");
            if (isValid)
                userData.documentNumber = Convert.ToInt32(txtDocumentNumber.Text);
            else
                return null;

            isValid = Validaciones.validAndRequiredMail(txtMail.Text, "El mail es necesario");
            if (isValid)
                userData.mail = this.txtMail.Text;
            else
                return null;

            isValid = Validaciones.requiredString(txtNameLastname.Text, "El nombre/apellido es necesario");
            if (isValid)
                userData.nameLastname = this.txtNameLastname.Text;
            else
                return null;

            isValid = Validaciones.requiredString(txtTelephone.Text, "El telefono es necesario");
            if (isValid)
                userData.telephone = this.txtTelephone.Text;
            else
                return null;

            isValid = Validaciones.requiredString(txtUsername.Text, "El usuario es necesario");
            if (isValid)
                userData.username = this.txtUsername.Text;
            else
                return null;

            isValid = Validaciones.requiredString(this.comboBoxDocumentType.SelectedValue.ToString(), "Debe seleccionar un tipo de documento");
            if (isValid)
                userData.typeDocument = Convert.ToInt32(this.comboBoxDocumentType.SelectedValue.ToString());
            else
                return null;

            userData.enabled = this.checkBoxEnable.Checked;

            DateTime birthDate = this.dtBirthDate.Value;
            DateHelper.truncate(birthDate);
            userData.birthDate = birthDate;

            return userData;
        }
    }
}
