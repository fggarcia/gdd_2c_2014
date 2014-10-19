using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

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
            string ConnectionString="Server=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
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

    }
}
