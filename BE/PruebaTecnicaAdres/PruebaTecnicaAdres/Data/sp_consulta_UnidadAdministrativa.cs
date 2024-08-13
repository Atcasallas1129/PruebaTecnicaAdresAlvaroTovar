using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaAdres.Data
{
    public class sp_consulta_UnidadAdministrativa
    {
        public sp_consulta_UnidadAdministrativa() { }
        [Key]
        public int UnidadAdministrativaId { get; set; }
        public string Nombre { get; set; }
    }
}
