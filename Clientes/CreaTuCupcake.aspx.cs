using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Clientes
{
    public partial class CreaTuCupcake : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.DataBind();
                if (lsvMasas.Items.Count > 0)
                {
                    lsvMasas.SelectedIndex = 0;
                    ListViewItem it = (ListViewItem)lsvMasas.Items[lsvMasas.SelectedIndex];
                    ImageButton btn = (ImageButton)it.FindControl("imagen");

                    imgMasa.ImageUrl = btn.ImageUrl;
                }

                if (lsvCrema.Items.Count > 0)
                {
                    lsvCrema.SelectedIndex = 0;
                    ListViewItem it = (ListViewItem)lsvCrema.Items[lsvCrema.SelectedIndex];
                    ImageButton btn = (ImageButton)it.FindControl("imagen");

                    imgCrema.ImageUrl = btn.ImageUrl;
                }

                if (lsvtopping.Items.Count > 0)
                {
                    lsvtopping.SelectedIndex = 0;
                    ListViewItem it = (ListViewItem)lsvtopping.Items[lsvtopping.SelectedIndex];
                    ImageButton btn = (ImageButton)it.FindControl("imagen");

                    imgTopping.ImageUrl = btn.ImageUrl;
                }
            }
        }

        protected void lsvtopping_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListViewItem it = (ListViewItem)lsvtopping.Items[lsvtopping.SelectedIndex];
            ImageButton btn = (ImageButton)it.FindControl("imagen");

            imgTopping.ImageUrl = btn.ImageUrl;
        }

        protected void lsvCrema_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListViewItem it = (ListViewItem)lsvCrema.Items[lsvCrema.SelectedIndex];
            ImageButton btn = (ImageButton)it.FindControl("imagen");

            imgCrema.ImageUrl = btn.ImageUrl;
        }

        protected void lsvMasas_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListViewItem it = (ListViewItem)lsvMasas.Items[lsvMasas.SelectedIndex];
            ImageButton btn = (ImageButton)it.FindControl("imagen");

            imgMasa.ImageUrl = btn.ImageUrl;
        }

        protected void btnCrearDiseno_Click(object sender, EventArgs e)
        {
            AgregarDiseño();
            Response.Redirect("~/Clientes/Galeria.aspx", true);
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            int id = AgregarDiseño();
            List<ListaCompras> lista;
            if (Session["ListaCompras"] == null)
                lista = new List<ListaCompras>();
            else
                lista = (List<ListaCompras>)Session["ListaCompras"];

            lista.Add(new ListaCompras(lista.Count, id, int.Parse(txtCantidad.Text)));

            Session["ListaCompras"] = lista;
            Response.Redirect("~/CarritoCompras.aspx", true);
        }

        protected int AgregarDiseño()
        {
            using (dbLQDataContext db = new dbLQDataContext())
            {
                diseno nuevo_diseno = new diseno
                {
                    nombre = txtNombre.Text.Trim(),
                    idbase = int.Parse(lsvMasas.SelectedDataKey.Value.ToString()),
                    idcrema = int.Parse(lsvCrema.SelectedDataKey.Value.ToString()),
                    idtopping = int.Parse(lsvtopping.SelectedDataKey.Value.ToString()),
                };

                if (User.Identity.IsAuthenticated)
                    nuevo_diseno.idusuario = User.Identity.Name;
                else
                    nuevo_diseno.idusuario = "anonimo";

                db.disenos.InsertOnSubmit(nuevo_diseno);

                db.SubmitChanges();
                return nuevo_diseno.iddiseno;
            }
        }
    }
}