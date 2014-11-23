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
                this.txtUsername.Text = user;
                this.txtUsername.Enabled = false;
                this.comboBoxDocumentType.SelectedIndex = this.comboBoxDocumentType.FindStringExact(userData.typeDocumentDescription);
                this.checkBoxEnable.Checked = userData.enabled;

                this.dtBirthDate.Value = userData.birthDate;

                Rol rolUsuario = UsuarioHelper.getRolByUserHotel(user, VarGlobal.usuario.hotel);
                this.comboBoxRol.SelectedIndex = this.comboBoxRol.FindStringExact(rolUsuario.description);
            }
        }

        private void loadProfileToEdit(String user)
        {

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
    }
}
