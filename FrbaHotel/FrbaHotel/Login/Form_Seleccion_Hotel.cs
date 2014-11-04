using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Common;
using System.Data.SqlClient;

namespace FrbaHotel.Login
{
    public partial class Form_Seleccion_Hotel : Form
    {
        public Form_Seleccion_Hotel(string nombre)
        {
            InitializeComponent();
            dataGrid_Hotel.ColumnHeadersVisible = false;
            dataGrid_Hotel.RowHeadersVisible = false;

            AppConnections DbManager = new AppConnections();

            SqlConnection DBSql = DbManager.Setup_Connection();
            
            SqlCommand Sp_Seleccion = new SqlCommand();
            Sp_Seleccion.CommandText = "SP_Retrieve_Hotel_Names";
            Sp_Seleccion.CommandType = CommandType.StoredProcedure;
            Sp_Seleccion.Connection = DBSql;
            Sp_Seleccion.Parameters.Add(new SqlParameter("@usuario", SqlDbType.VarChar));
            Sp_Seleccion.Parameters["@usuario"].Value = nombre;
            DBSql.Open();
            SqlDataAdapter roles_adapter = new SqlDataAdapter();
            DataTable dt = new DataTable();
            roles_adapter.SelectCommand = Sp_Seleccion;
            roles_adapter.Fill(dt);
            dataGrid_Hotel.DataSource = dt;

        
            DBSql.Close();

            
        }
    }
}
