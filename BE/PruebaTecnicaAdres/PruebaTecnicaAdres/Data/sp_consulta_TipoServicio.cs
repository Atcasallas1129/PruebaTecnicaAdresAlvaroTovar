using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaAdres.Data
{
    public class sp_consulta_TipoServicio
    {
        public sp_consulta_TipoServicio() { }
        [Key]
        public int TipoServicioId { get; set; }
        public string TipoServicioNombre {get; set;}
    }
}
