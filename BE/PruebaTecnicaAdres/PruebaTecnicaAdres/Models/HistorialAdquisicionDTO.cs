namespace PruebaTecnicaAdres.Models
{
    public class HistorialAdquisicionDTO
    {
        public DateTime fechaModificacion { get; set; }
        public string CambioRealizado { get; set; }
        public string ValorInicial { get; set; }
        public string ValorActualizado { get; set; }
        public int AdquisicionId { get; set; }
    }
}
