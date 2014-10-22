using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;


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

        private void Form_Login_Load(object sender, EventArgs e)
        {
            SqlConnection DBSql;
            string ConnectionString = "Server=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
            DBSql = new SqlConnection(ConnectionString);
            try
            {
                DBSql.Open();
                MessageBox.Show("Connection Open ! ");
                DBSql.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Can not open connection ! ");
            }
        }

        private void button_Login_Click(object sender, EventArgs e)
        {
            MessageBox.Show(textBox_usuario.Text);
            MessageBox.Show(textBox1.Text);
            MessageBox.Show(SHA256Encrypt(textBox1.Text));


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
    }
}
