using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Materiales
{
    public partial class masas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void lsvDatos_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            FileUpload imgFile = (FileUpload)e.Item.FindControl("imgFile");

            if (imgFile.HasFile == true)
            {
                imgFile.SaveAs(Server.MapPath("~/Materiales/masas/" + imgFile.FileName));
                e.Values["imagen"] = imgFile.FileName;
            }
            else
                e.Cancel = true;
        }

        protected void lsvDatos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "AgregarMasa")
            {
                lsvDatos.InsertItemPosition = InsertItemPosition.FirstItem;
            }
        }

        protected void lsvDatos_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            lsvDatos.InsertItemPosition = InsertItemPosition.None;
        }

        protected void lsvDatos_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            ListViewItem it = lsvDatos.Items[e.ItemIndex];
            FileUpload img = (FileUpload)it.FindControl("imgFile");
            Image foto = (Image)it.FindControl("imagenTextBox");

            if (img.FileName != "")
                e.NewValues["imagen"] = img.FileName;

            if (e.NewValues["imagen"] != e.OldValues["imagen"])
            {
                try
                {
                    System.IO.File.Delete(Server.MapPath("~/Materiales/masas/" + System.IO.Path.GetFileName(foto.ImageUrl)));
                }
                catch
                { }

                img.SaveAs(Server.MapPath("~/Materiales/masas/" + img.FileName));
            }
        }

        protected void lsvDatos_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            
        }

        protected void lsvDatos_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lsvDatos.InsertItemPosition = InsertItemPosition.None;
        }

        protected void lsvDatos_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            ListViewItem it = lsvDatos.Items[e.ItemIndex];

             int usado;
            using (dbLQDataContext db = new dbLQDataContext())
            {
                usado = (from c in db.disenos where c.idbase == int.Parse(e.Keys[0].ToString()) select c).Count();
            }


            if (usado > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('El item no puede eliminarse debido a que está siendo utilizado en un diseño');", true);
                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "alert", "", true);
                e.Cancel = true;
            }
            else
            {
                Image img = (Image)it.FindControl("imagenLabel");

                try
                {
                    System.IO.File.Delete(Server.MapPath("~/Materiales/masas/" + System.IO.Path.GetFileName(img.ImageUrl)));
                }
                catch { }
            }
        }
    }
}