using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ventas
    {
        public Ventas(int idVentas, string nombreCliente, string nombreEmpleado,
            string cantidadVentas, string fecha, int fkIdProducto, int fkIdCompra)
        {
            IdVentas = idVentas;
            NombreCliente = nombreCliente;
            NombreEmpleado = nombreEmpleado;
            CantidadVentas = cantidadVentas;
            Fecha = fecha;
            FkIdProducto = fkIdProducto;
            FkIdCompra = fkIdCompra;
        }

        public int IdVentas { get; set; }
        public string NombreCliente { get; set; }
        public string NombreEmpleado { get; set; }
        public string CantidadVentas { get; set; }
        public string Fecha { get; set; }
        public int FkIdProducto { get; set; }
        public int FkIdCompra { get; set; }
    }
}
