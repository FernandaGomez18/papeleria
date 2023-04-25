using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class RegistroCompras
    {
        public RegistroCompras(int idCompra, string nombreCliente, 
            string nombreEmpleado, string cantidadProducto, string producto, string fecha, int fkIdUsuario, int fkIdProducto)
        {
            IdCompra = idCompra;
            NombreCliente = nombreCliente;
            NombreEmpleado = nombreEmpleado;
            CantidadProducto = cantidadProducto;
            Producto = producto;
            Fecha = fecha;
            FkIdUsuario = fkIdUsuario;
            FkIdProducto = fkIdProducto;
        }

        public int IdCompra { get; set; }
        public string NombreCliente { get; set; }
        public string NombreEmpleado { get; set; }
        public string CantidadProducto { get; set; }
        public string Producto { get; set; }
        public string Fecha { get; set; }
        public int FkIdUsuario { get; set; }
        public int FkIdProducto { get; set; }
    }
}
