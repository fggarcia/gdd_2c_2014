﻿using System;
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

namespace FrbaHotel.Login
{
    public partial class Form_Login : Form
    {
        public Form_Login()
        {
            InitializeComponent();
        }

        private void button_salir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

       
        private void button_Login_Click(object sender, EventArgs e)
        {
            AppConnections DbManager = new AppConnections();

            SqlConnection DBSql = DbManager.Setup_Connection();
                                                
            SqlCommand Sp_Login = new SqlCommand();

            Sp_Login.CommandText = "SP_Login_User";
            Sp_Login.CommandType = CommandType.StoredProcedure;
            Sp_Login.Connection = DBSql;
            Sp_Login.Parameters.Add(new SqlParameter("@usuario", SqlDbType.VarChar));
            Sp_Login.Parameters["@usuario"].Value=textBox_usuario.Text;
            Sp_Login.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar));
            Sp_Login.Parameters["@password"].Value=SHA256Encrypt(textbox_password.Text);
            Sp_Login.Parameters.Add(new SqlParameter("@codigo", SqlDbType.Int));
            Sp_Login.Parameters["@codigo"].Direction=ParameterDirection.Output;
            
            DBSql.Open();
            
            Sp_Login.ExecuteNonQuery();
            
            Int16 resultado;
            
            resultado=Convert.ToInt16(Sp_Login.Parameters["@codigo"].Value);

            switch (resultado)
            {
                case 1:
                    MessageBox.Show("Usuario Inhabilitado");
                    break;
                case 2:

                    int cant_hoteles;

                    cant_hoteles = Check_Hoteles(textBox_usuario.Text,DBSql);

                    if (cant_hoteles > 1)
                    {
                        var form = new Form_Seleccion_Hotel(textBox_usuario.Text);
                        form.Show();
                        this.Hide();
                    }

                    else
                    {
                        int roles;

                        roles = Check_Roles(textBox_usuario.Text, DBSql);
                        if (roles > 1)
                        {
                            var form = new Form_Seleccion_Rol(textBox_usuario.Text);
                            form.Show();
                            this.Hide();
                        }
                    }
                    break;
                case 3:
                    MessageBox.Show("Usuario/Contraseña Incorrecto");
                    break;
            }
            DBSql.Close();
        }

        public string SHA256Encrypt(string password)
        {
            SHA256CryptoServiceProvider provider = new SHA256CryptoServiceProvider();

            byte[] passBytes = Encoding.UTF8.GetBytes(password);
            byte[] hashedpass = provider.ComputeHash(passBytes);

            StringBuilder resultado = new StringBuilder();

            for (int i = 0; i < hashedpass.Length; i++)
                resultado.Append(hashedpass[i].ToString("x2").ToLower());

            return resultado.ToString();
        }

        public int Check_Hoteles(string nombre,SqlConnection conexionDB)
        {
            SqlCommand Sp_Hoteles = new SqlCommand();
            Sp_Hoteles.CommandText = "SP_Retrieve_Hotel_Quantity";
            Sp_Hoteles.CommandType = CommandType.StoredProcedure;
            Sp_Hoteles.Connection = conexionDB;
            Sp_Hoteles.Parameters.Add(new SqlParameter("@usuario", SqlDbType.VarChar));
            Sp_Hoteles.Parameters["@usuario"].Value = textBox_usuario.Text;
            Sp_Hoteles.Parameters.Add(new SqlParameter("@cant", SqlDbType.Int));
            Sp_Hoteles.Parameters["@cant"].Direction = ParameterDirection.Output;
            Sp_Hoteles.ExecuteNonQuery();

            Int16 hoteles = Convert.ToInt16(Sp_Hoteles.Parameters["@cant"].Value);
            return hoteles;
        }

        public int Check_Roles(string nombre, SqlConnection conexionDB)
        {
            SqlCommand Sp_Roles = new SqlCommand();
            Sp_Roles.CommandText = "SP_Retrieve_Roles_Quantity";
            Sp_Roles.CommandType = CommandType.StoredProcedure;
            Sp_Roles.Connection = conexionDB;
            Sp_Roles.Parameters.Add(new SqlParameter("@usuario", SqlDbType.VarChar));
            Sp_Roles.Parameters["@usuario"].Value = textBox_usuario.Text;
            Sp_Roles.Parameters.Add(new SqlParameter("@cantidad", SqlDbType.Int));
            Sp_Roles.Parameters["@cantidad"].Direction = ParameterDirection.Output;
            Sp_Roles.ExecuteNonQuery();

            Int16 roles = Convert.ToInt16(Sp_Roles.Parameters["@cantidad"].Value);
            return roles;
        }

    }

   
}