using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class RegistroProducto
    {
        public int IdProducto { get; set; }
        public string NombreProducto { get; set; }
        public string Descripcion { get; set; }
        public string Cantidad { get; set; }
        public string Precio { get; set; }

    }
}
