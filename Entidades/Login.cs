using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Login
    {
        public Login(int contraseña, string nombreUsuario)
        {
            Contraseña = contraseña;
            NombreUsuario = nombreUsuario;
        }

        public int Contraseña { get; set; }
        public string NombreUsuario { get; set; }
    }
}
