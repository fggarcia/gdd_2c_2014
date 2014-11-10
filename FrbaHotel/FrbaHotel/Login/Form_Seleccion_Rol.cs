﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using FrbaHotel.Common;
using System.Windows.Forms;

namespace FrbaHotel.Login
{
    public partial class Form_Seleccion_Rol : Form
    {
        public Form_Seleccion_Rol(string nombre)
        {
            InitializeComponent();
            dataGrid_Rol.ColumnHeadersVisible = false;
            dataGrid_Rol.RowHeadersVisible = false;
            AppConnections DbManager = new AppConnections();

            SqlConnection DBSql = DbManager.Setup_Connection();
            
            SqlCommand Sp_Seleccion = new SqlCommand();
            Sp_Seleccion.CommandText = "SP_Retrieve_Roles_Names";
            Sp_Seleccion.CommandType = CommandType.StoredProcedure;
            Sp_Seleccion.Connection = DBSql;
            Sp_Seleccion.Parameters.Add(new SqlParameter("@usuario", SqlDbType.VarChar));
            Sp_Seleccion.Parameters["@usuario"].Value = nombre;
            DBSql.Open();
            SqlDataAdapter roles_adapter = new SqlDataAdapter();
            DataTable dt = new DataTable();
            roles_adapter.SelectCommand = Sp_Seleccion;
            roles_adapter.Fill(dt);
            dataGrid_Rol.DataSource = dt;


            DBSql.Close();

            
        }

             
    }
}
