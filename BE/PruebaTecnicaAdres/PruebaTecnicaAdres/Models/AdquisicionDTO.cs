namespace PruebaTecnicaAdres.Models
{
    public class AdquisicionDTO
    {
        public int? AdquisicionId { get; set; }
        public decimal Presupuesto { get; set; }
        public DateTime FechaAdquisicion { get; set; }
        public int Cantidad { get; set; }
        public decimal ValorUnitario { get; set; }
        public int UnidadAdministrativaId { get; set; }
        public bool Activo { get; set; }
        public int ProveedorId { get; set; }
        public int TipoBienServicio { get; set; }
        public List<DocumentacionAdquisicionDTO>? documentacion { get; set; }


    }
}
