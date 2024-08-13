using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaAdres.Data
{
    public class sp_consulta_DocumentacionAdquisicion
    {
        public sp_consulta_DocumentacionAdquisicion() { }
        [Key]
        public int AdquisicionId { get; set; }
		public int DocumentacionId {get;set;}
		public string Descripcion {get;set;}
		public string Detalles {get;set;}
    }
}
