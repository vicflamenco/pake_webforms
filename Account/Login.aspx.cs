using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected bool Autenticar(string usuario, string pass)
        {
            using (dbLQDataContext db = new dbLQDataContext())
            {
                try
                {
                    int user = (from c in db.usuarios
                                    where c.idusuario == usuario
                                    where c.clave == pass
                                    select c).Count();

                    if (user != 0)
                    {
                        bool admin = (from c in db.usuarios
                                 where c.idusuario == usuario
                                 where c.clave == pass
                                 select c.admin).First();

                        Session["idUsuario"] = usuario;
                        Session["admin"] = admin;
                        return true;
                    }
                    else
                        return false;
                }
                catch
                {
                    return false;
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
             if (Autenticar(UserName.Text,Password.Text))
            {
                //Session["admin"] = adm;
                FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);
            }
        }

        protected void LoginUser_LoggingIn(object sender, LoginCancelEventArgs e)
        {
           
        }
    }
}
