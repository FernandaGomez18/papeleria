using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Accesos
{
    public class AccesoLogin : Interface1
    {
        Base b = new Base("localhost", "root", "", "3D");
        public void Borrar(dynamic Entidad)
        {
            throw new NotImplementedException();
        }

        public void Guardar(dynamic Entidad)
        {
            throw new NotImplementedException();
        }

        public DataSet Mostrar(string filtro)
        {
            throw new NotImplementedException();
        }
    }
}
