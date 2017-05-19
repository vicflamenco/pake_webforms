using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Clientes
{
    public partial class Galeria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lsvDatos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Carrito")
            {
                lsvDatos.SelectItem(e.Item.DisplayIndex);
                ModalPopupExtender1.Show();
            }
            else if (e.CommandName == "Compartir")
            {
                ListViewDataItem it = lsvDatos.Items[e.Item.DisplayIndex];

                string title ="Cupcake Personalizado";
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                string summery="Crea tu cupcake como siempre lo has deseado!";
                string image = Request.Url.AbsoluteUri.Replace(Request.Url.AbsolutePath, String.Empty) + "/Materiales/bases/B2.png" ;

                string facebooklink = "p[url]=" + HttpUtility.UrlEncode(url);
                facebooklink += "&p[images][0]=" + HttpUtility.UrlEncode(image);
                facebooklink += "&p[title]=" + HttpUtility.UrlEncode(title);
                facebooklink += "&p[summary]=" + HttpUtility.UrlEncode(summery);
               
                //string prueba = "http://www.facebook.com/sharer.php?s=100&p[url]=http%3A//www.scientia.com.ar&p[images][0]=http%3A//www.scientia.com.ar/images/Splash3.gif&p[title]=Scientia%C2%AE%20Soluciones%20Inform%C3%A1ticas&p[summary]=Scientia%C2%AE%20ofrece%20servicios%20de%20dise%C3%B1o%2C%20desarrollo%20e%20implementaci%C3%B3n%20de%20software%20sobre%20metodolog%C3%ADas%20agiles%20de%20gesti%C3%B3n%20de%20proyectos";

                string s = "window.open('" + "http://www.facebook.com/sharer.php?s=100&" + facebooklink + "', 'popup_window', 'width=300,height=300,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            List<ListaCompras> lista;
            if (Session["ListaCompras"] == null)
                lista = new List<ListaCompras>();
            else
                lista = (List<ListaCompras>)Session["ListaCompras"];

            lista.Add(new ListaCompras(lista.Count, int.Parse(lsvDatos.SelectedDataKey.Value.ToString()), int.Parse(txtCantidad.Text)));

            Session["ListaCompras"] = lista;
            Response.Redirect("~/CarritoCompras.aspx", true);
        }
    }
}