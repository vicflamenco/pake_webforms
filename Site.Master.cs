using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (bool.Parse(Session["admin"].ToString()) != true)
                    {
                        NavigationMenu.Items.RemoveAt(2);
                    }
                    else
                    {
                        //NavigationMenu.Items.RemoveAt(1);
                    }
                }
                else
                {
                    NavigationMenu.Items.RemoveAt(2);
                    NavigationMenu.Items.RemoveAt(1);
                }
            }
            catch (Exception)
            {
                NavigationMenu.Items.RemoveAt(2);
                NavigationMenu.Items.RemoveAt(1);
            }
        }
    }
}
