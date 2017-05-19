using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace WebApplication1
{
    public partial class CarritoCompras : System.Web.UI.Page
    {
        decimal precioTotal;

        protected void EnlazarCarrito()
        {
            List<ListaCompras> listado = (List<ListaCompras>)Session["ListaCompras"];

            dgCarrito.DataSource = listado;
            dgCarrito.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            EnlazarCarrito();
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(WizardStep3.FindControl("btnImprimir"));
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void dgCarrito_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                precioTotal += ((WebApplication1.ListaCompras)e.Row.DataItem).precio * ((WebApplication1.ListaCompras)e.Row.DataItem).cantidad;
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "$ " +  decimal.Round(precioTotal,2).ToString();
                lblSubtotal.Text = "$ " + decimal.Round(precioTotal,2).ToString();
                lblIVA.Text = "$ " + decimal.Round(precioTotal * decimal.Parse("0.13"), 2).ToString();
                lblTotal.Text = "$ " + decimal.Round(precioTotal + (precioTotal * decimal.Parse("0.13")), 2).ToString();
            }
                
        }

        protected void dgCarrito_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ModalPopupExtender1.Show();
            txtCantidad.Text = ((Label)dgCarrito.Rows[e.NewEditIndex].FindControl("lblCantidad")).Text;

            ViewState["rowEdit"] = e.NewEditIndex;
            e.Cancel = true;
        }

        protected void dgCarrito_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<ListaCompras> listado = (List<ListaCompras>)Session["ListaCompras"];
            listado.RemoveAt(int.Parse(e.RowIndex.ToString()));

            Session["ListaCompras"] = listado;
            EnlazarCarrito();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            List<ListaCompras> listado = (List<ListaCompras>)Session["ListaCompras"];
            listado.ElementAt((int)ViewState["rowEdit"]).cantidad = int.Parse(txtCantidad.Text.ToString());
            Session["ListaCompras"] = listado;
            EnlazarCarrito();
        }

        protected void dtpCalendario_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.AddDays(1))
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (e.CurrentStepIndex == 0)
            {
                if (dgCarrito.Rows.Count == 0)
                    e.Cancel = true;
                else
                    Wizard1.MoveTo(WizardStep2);
            }
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
                e.Cancel = true;
            }
            else if ((dtpCalendario.SelectedDate < DateTime.Now.AddDays(1)) || (txtDirEntrega.Text.Trim() == "") || (txtDirFactura.Text.Trim() == ""))
            {
                lblValidar.Visible = true;
                e.Cancel = true;
            }
            else //Guardando Pedido
            {
                using (dbLQDataContext db = new dbLQDataContext())
                {
                    pedido nuevo_pedido = new pedido
                    {
                        idusuario = HttpContext.Current.User.Identity.Name,
                        fecha = DateTime.Now,
                        fecha_entrega = dtpCalendario.SelectedDate,
                        dir_entrega = txtDirEntrega.Text.Trim(),
                        dir_factura = txtDirFactura.Text.Trim(),
                        subtotal = precioTotal,
                        iva = precioTotal * decimal.Parse("0.13"),
                        total = precioTotal * decimal.Parse("0.13") + precioTotal
                    };

                    List<ListaCompras> listado = (List<ListaCompras>)Session["ListaCompras"];

                    foreach (ListaCompras item in listado)
                    {
                        pedido_detalle cupcake = new pedido_detalle
                        {
                            iddiseno = item.iddiseno,
                            cantidad = item.cantidad,
                            precio = item.precio,
                        };
                        nuevo_pedido.pedido_detalles.Add(cupcake);
                    }

                    db.pedidos.InsertOnSubmit(nuevo_pedido);
                    try
                    {
                        db.SubmitChanges();
                    }
                    catch (ChangeConflictException)
                    {
                        db.ChangeConflicts.ResolveAll(RefreshMode.KeepCurrentValues);
                        db.SubmitChanges();
                    }
                    //Response.Redirect("~/Clientes/Pedidos.aspx");
                }
            }

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Pedido.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            dgCarrito.AllowPaging = false;
            dgCarrito.Columns[3].Visible = false;
            dgCarrito.DataBind();
            
            dgCarrito.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            dgCarrito.AllowPaging = true;
            dgCarrito.Columns[3].Visible = true;
            dgCarrito.DataBind();
        }
    }
}