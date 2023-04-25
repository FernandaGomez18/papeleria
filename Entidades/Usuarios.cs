using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        public Usuarios(int idUsuario, string nombre, string apellidos, string puesto)
        {
            IdUsuario = idUsuario;
            Nombre = nombre;
            Apellidos = apellidos;
            Puesto = puesto;
        }

        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Puesto { get; set; }
    }
}
