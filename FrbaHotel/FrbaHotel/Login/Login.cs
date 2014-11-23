using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace FrbaHotel.Login
{
    class Login
    {
        public static Boolean isValidUser(Usuario user){
            SqlCommand sp_check_user = new SqlCommand();
            sp_check_user.CommandText = "LA_MAYORIA.sp_login_check_valid_user";
            sp_check_user.Parameters.Add(new SqlParameter("@p_id", SqlDbType.VarChar));
            sp_check_user.Parameters["@p_id"].Value = user.id;

            var returnParameterIsValid = sp_check_user.Parameters.Add(new SqlParameter("@p_is_valid", SqlDbType.Bit));
            returnParameterIsValid.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_check_user, "chequear usuario valido", false);

            int isValid = Convert.ToInt16(returnParameterIsValid.Value);

            if (isValid == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static int login(Usuario user, String password)
        {
            SqlCommand sp_check_password = new SqlCommand();
            sp_check_password.CommandText = "LA_MAYORIA.sp_login_check_password";
            sp_check_password.Parameters.Add(new SqlParameter("@p_id", SqlDbType.VarChar));
            sp_check_password.Parameters["@p_id"].Value = user.id;
            sp_check_password.Parameters.Add(new SqlParameter("@p_pass", SqlDbType.VarChar));
            sp_check_password.Parameters["@p_pass"].Value = Encrypt.Sha256(password);

            var returnParameterIsValid = sp_check_password.Parameters.Add(new SqlParameter("@p_intentos", SqlDbType.Int));
            returnParameterIsValid.Direction = ParameterDirection.InputOutput;

            ProcedureHelper.execute(sp_check_password, "chequear password", false);

            return Convert.ToInt16(returnParameterIsValid.Value);
        }
    }
}
