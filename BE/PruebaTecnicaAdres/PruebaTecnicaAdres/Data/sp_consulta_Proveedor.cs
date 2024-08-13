using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaAdres.Data
{
    public class sp_consulta_Proveedor
    {
        public sp_consulta_Proveedor()
        {

        }
        [Key]
        public int ProveedorId { get; set; }
        public string Nombre {get;set;}
    }
}
