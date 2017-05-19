using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Clientes
{
    public partial class pedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
                FormsAuthentication.RedirectToLoginPage();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }
    }
}