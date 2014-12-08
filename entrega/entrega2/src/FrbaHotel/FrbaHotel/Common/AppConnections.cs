using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace FrbaHotel.Common
{
    public class AppConnections
    {
        public SqlConnection Setup_Connection()
        {
            SqlConnection DBSql;
            string ConnectionString = "Server=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
            DBSql = new SqlConnection(ConnectionString);
            return DBSql;
        }
    }

   }
