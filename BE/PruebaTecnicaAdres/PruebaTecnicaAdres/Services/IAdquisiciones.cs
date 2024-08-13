using PruebaTecnicaAdres.Data;
using PruebaTecnicaAdres.Models;
using System.Collections;

namespace PruebaTecnicaAdres.Services
{
    public interface IAdquisiciones
    {
        public IEnumerable<sp_consulta_Adquisicion> ConsultarAdquisicion(int? idAdquisicion);
        public IEnumerable<sp_consulta_Proveedor> consultaProveedor();
        public IEnumerable<sp_consulta_TipoServicio> consultaTipoServicio();
        public IEnumerable<sp_consulta_UnidadAdministrativa> consultaUnidadAdministrativa();
        public IEnumerable<sp_consulta_DocumentacionAdquisicion> consultaDocumentacionAdquisicion(int idAdquisicion);
        public sp_insertAdquisicion InsertarAdquisicion(AdquisicionDTO request);
        public void ActualizarAdquisicion(AdquisicionDTO request);
        public void InsertarDocumentacion(DocumentacionAdquisicionDTO request);
        public void InsertarHistorial(HistorialAdquisicionDTO request);

        public IEnumerable<sp_consultaHistorialAdquisicion> consultaHistorialAdquisicion(int idAdquisicion);
    }
}
