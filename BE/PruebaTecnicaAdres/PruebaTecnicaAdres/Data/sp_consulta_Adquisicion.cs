using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaAdres.Data
{
    public class sp_consulta_Adquisicion
    {
        public sp_consulta_Adquisicion() { }
		[Key]
        public int AdquisicionId {get;set;}
		public decimal Presupuesto {get;set;}
		public int Cantidad {get;set;}
		public decimal ValorUnitario {get;set;}
		public decimal ValorTotal {get;set;}
		public bool Activo {get;set;}
		public DateTime FechaAdquisicion {get;set;}
		public int UnidadAdministrativaId {get;set;}
		public string UnidadAdministrativaNombre { get;set;}
        public int ProveedorId {get;set;}
		public string ProveedorNombre { get;set;}
        public int TipoBienServicio {get;set;}
		public string TipoServicioNombre { get; set; }
    }
}
