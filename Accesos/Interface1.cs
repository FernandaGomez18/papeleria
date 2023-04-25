using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Accesos
{
    public interface Interface1
    {
        void Guardar(dynamic Entidad);
        void Borrar(dynamic Entidad);
        DataSet Mostrar(string filtro);
    }
}
