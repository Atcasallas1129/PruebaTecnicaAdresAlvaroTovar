using System.ComponentModel.DataAnnotations;

namespace PruebaTecnicaAdres.Data
{
    public class sp_insertAdquisicion
    {
        public sp_insertAdquisicion() { }
        [Key]
        public int AdquisicionId { get; set; }
    }
}
