using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class ListaCompras
    {
        public int id;
        public int iddiseno;
        public int cantidad;
        public decimal precio;
        public string nombre;
        public string urlbase;
        public string urlcrema;
        public string urltop;

        public ListaCompras(int ID, int idDiseno, int cant)
        {
            this.id = ID;
            this.iddiseno = idDiseno;
            this.cantidad = cant;

            using (dbLQDataContext db = new dbLQDataContext())
            {
                diseno dis = (from c in db.disenos
                              where c.iddiseno == this.iddiseno
                              select c).First();
                this.precio = decimal.Parse((dis.@base.precio + dis.crema.precio + dis.topping.precio).ToString());
                this.nombre = dis.nombre;
                urlbase = "~/Materiales/masas/" + dis.@base.imagen;
                urlcrema = "~/Materiales/cremas/" + dis.crema.imagen;
                urltop = "~/Materiales/topping/" + dis.topping.imagen;
            }

        }       
    }
}