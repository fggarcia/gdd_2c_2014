using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace FrbaHotel.Seguridad
{
    class PasswordHelper
    {
        public static Boolean isCorrectPassword(String password)
        {
            SqlCommand sp_check_password = new SqlCommand();
            sp_check_password.CommandText = "LA_MAYORIA.sp_password_check_ok";
            sp_check_password.Parameters.Add(new SqlParameter("@p_id", SqlDbType.VarChar));
            sp_check_password.Parameters["@p_id"].Value = VarGlobal.usuario.id;
            sp_check_password.Parameters.Add(new SqlParameter("@p_pass", SqlDbType.VarChar));
            sp_check_password.Parameters["@p_pass"].Value = Encrypt.Sha256(password);

            var returnParameterIsOk = sp_check_password.Parameters.Add(new SqlParameter("@p_ok", SqlDbType.Int));
            returnParameterIsOk.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_check_password, "chequear password", false);

            Int16 isOk = Convert.ToInt16(returnParameterIsOk.Value);

            if (isOk != 0)
            {
                return true;
            }

            return false;
        }

        public static void change(string password)
        {
            SqlCommand sp_check_password = new SqlCommand();
            sp_check_password.CommandText = "LA_MAYORIA.sp_password_change";
            sp_check_password.Parameters.Add(new SqlParameter("@p_id", SqlDbType.VarChar));
            sp_check_password.Parameters["@p_id"].Value = VarGlobal.usuario.id;
            sp_check_password.Parameters.Add(new SqlParameter("@p_pass", SqlDbType.VarChar));
            sp_check_password.Parameters["@p_pass"].Value = Encrypt.Sha256(password);

            ProcedureHelper.execute(sp_check_password, "chequear password", false);
        }
    }
}
