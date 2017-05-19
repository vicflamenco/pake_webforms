using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace WebApplication1.Admin
{
    public partial class PedidosAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(updatepanel1.FindControl("btnImprimir"));
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            //try
            //{
                if ((ckUsuario.Checked == true) && (ckFecha.Checked == true))
                {
                    SqlDataSource1.SelectCommand = "SELECT idpedido, idusuario, fecha, fecha_entrega, dir_entrega, dir_factura, entregado, subtotal, iva, total FROM pedido WHERE idusuario LIKE '%" + txtBUser.Text.Trim() + "%' AND ((fecha_entrega <= @fecha2) AND (fecha_entrega >= @fecha1))";
                    SqlDataSource1.SelectParameters.Clear();
                    
                    SqlDataSource1.SelectParameters.Add("fecha1", System.Data.DbType.String, txtFecha1.Text);
                    SqlDataSource1.SelectParameters.Add("fecha2", System.Data.DbType.String, txtFecha2.Text);
                    GridView1.DataBind();
                }
                else if (ckUsuario.Checked == true)
                {
                    SqlDataSource1.SelectCommand = "SELECT idpedido, idusuario, fecha, fecha_entrega, dir_entrega, dir_factura, entregado, subtotal, iva, total FROM pedido WHERE idusuario LIKE '%" + txtBUser.Text.Trim() + "%'";

                    SqlDataSource1.SelectParameters.Clear();
                    GridView1.DataBind();
                }
                else if (ckFecha.Checked == true)
                {
                    SqlDataSource1.SelectCommand = "SELECT idpedido, idusuario, fecha, fecha_entrega, dir_entrega, dir_factura, entregado, subtotal, iva, total FROM pedido WHERE fecha_entrega <= @fecha2 AND fecha_entrega >= @fecha1";

                    SqlDataSource1.SelectParameters.Clear();

                    SqlDataSource1.SelectParameters.Add("fecha1", System.Data.DbType.String, txtFecha1.Text);
                    SqlDataSource1.SelectParameters.Add("fecha2", System.Data.DbType.String, txtFecha2.Text);
                    GridView1.DataBind();
                }
                else
                {
                    SqlDataSource1.SelectCommand = "SELECT idpedido, idusuario, fecha, fecha_entrega, dir_entrega, dir_factura, entregado, subtotal, iva, total FROM pedido";
                    
                    SqlDataSource1.SelectParameters.Clear();
                    GridView1.DataBind();
                }                    
            //}
            //catch (Exception)
            //{
            //    SqlDataSource1.SelectCommand = "SELECT idpedido, idusuario, fecha, fecha_entrega, dir_entrega, dir_factura, entregado, subtotal, iva, total FROM pedido";
            //    GridView1.DataBind();
            //}
        }

        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Pedidos.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                GridView1.AllowPaging = false;
                GridView1.Columns[0].Visible = false;
                GridView1.Columns[1].Visible = false;
                GridView1.Columns[7].Visible = false;

                GridView1.DataBind();

                GridView1.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());
                Document pdfDoc = new Document(PageSize.LETTER.Rotate(), 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();
                GridView1.AllowPaging = true;
                GridView1.Columns[0].Visible = true;
                GridView1.Columns[1].Visible = false;
                GridView1.Columns[7].Visible = true;
                GridView1.DataBind();
            }
        }
    }
}