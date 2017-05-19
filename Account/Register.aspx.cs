using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
                
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (dbLQDataContext db = new dbLQDataContext())
                {
                    try
                    {
                        int usua = (from c in db.usuarios where c.idusuario == UserName.Text.Trim() select c.idusuario).Count();
                        if (usua > 0)
                        {
                            ErrorMessage1.Text = "El usuario ya existe.";
                        }
                        else
                        {
                            usuario nuevo = new usuario
                            {
                                idusuario = UserName.Text.Trim(),
                                correo = Email.Text.Trim(),
                                clave = Password.Text.Trim(),
                            };

                            db.usuarios.InsertOnSubmit(nuevo);
                            db.SubmitChanges();
                            bool admin = (from c in db.usuarios
                                          where c.idusuario == UserName.Text.Trim()
                                          where c.clave == Password.Text.Trim()
                                          select c.admin).First();

                            Session["idUsuario"] = UserName.Text.Trim();
                            Session["admin"] = admin;

                            FormsAuthentication.RedirectFromLoginPage(UserName.Text, false);
                        }
                    }
                    catch (ChangeConflictException)
                    {
                        db.ChangeConflicts.ResolveAll(RefreshMode.KeepCurrentValues);
                        db.SubmitChanges();
                    }
                    catch (Exception)
                    {
                        ErrorMessage1.Text = "Ha ocurrido un problema. El proceso de registro no pudo completarse satisfactoriamente. Por favor, intentelo en otro momento.";
                        //throw;
                    }
                }
                //FormsAuthentication.SetAuthCookie(UserName.Text, false /* createPersistentCookie */);
               
            }
            else
            {
                ErrorMessage1.Text = "(*) Campos obligatorios";
            }
        }
    }
}
