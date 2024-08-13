using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaAdres.Data
{
    public class sp_consultaHistorialAdquisicion
    {
        public sp_consultaHistorialAdquisicion()
        {

        }
        [Key]
        public int HistorialAdquisicionId { get; set; }
        public DateTime FechaModificacion { get; set; }
        public string CambioRealizado { get; set; }
        public string? ValorInicial { get; set; }
        public string? ValorActualizado { get; set; }
        public int AdquisicionId { get; set; }
    }
}
