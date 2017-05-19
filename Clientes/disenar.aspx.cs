using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Clientes
{
    public partial class disenar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDisenar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Clientes/CreaTuCupcake.aspx",true);
        }

        protected void btnGaleria_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Clientes/Galeria.aspx", true);
        }
    }
}