using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;
using FrbaHotel.Common;
using System.Data.SqlClient;
using FrbaHotel.ABM_de_Rol;

namespace FrbaHotel.Login
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        private void button_salir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button_Login_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            user.id = textBox_usuario.Text;

            VarGlobal.usuario = user;

            String pass = textbox_password.Text;

            if (!Login.isValidUser(user))
            {
                MessageBox.Show("No es un usuario valido");
            }
            else
            {
                int intentos = Login.login(user, pass);

                if (intentos == 0)
                {
                    FormSeleccionRol fSeleccionRol = new FormSeleccionRol();
                    this.Hide();
                    fSeleccionRol.ShowDialog();
                    this.Close();
                }
                else if (intentos < 3)
                {
                    MessageBox.Show("La contraseña es erronea. Lleva intentos : " + intentos);
                }
                else
                {
                    MessageBox.Show("Contactese con el administrador para limpiar su clave");
                }
            }
        }

        private void button_LoginHuesped_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.hotel = 0;
            usuario.id = "guest";
            Rol rol = new Rol(3, "guest");
            usuario.rol = rol;

            VarGlobal.usuario = usuario;
            FormMenu formMenu = new FormMenu();
            this.Hide();
            formMenu.ShowDialog();
            this.Close();
        }
    }
}
