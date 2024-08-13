using Microsoft.EntityFrameworkCore;
using PruebaTecnicaAdres.Data;
using PruebaTecnicaAdres.Models;

namespace PruebaTecnicaAdres.Services
{
    public class Adquisiciones : IAdquisiciones
    {
        private readonly ProjectDbContext _context;

        public Adquisiciones(ProjectDbContext context)
        {
            _context = context;
        }
        public IEnumerable<sp_consulta_Adquisicion> ConsultarAdquisicion(int? idAdquisicion)
        {
            return _context.ConsultaAdquisicion(idAdquisicion);
        }

        public sp_insertAdquisicion InsertarAdquisicion(AdquisicionDTO request)
        {

            return _context.InsertAdquisicion(
                request.Presupuesto,
                request.Cantidad,
                request.ValorUnitario,
                request.FechaAdquisicion,
                request.UnidadAdministrativaId,
                request.ProveedorId,
                request.TipoBienServicio
            );
        }

        public void ActualizarAdquisicion(AdquisicionDTO request)
        {
            var adquisicionActual = _context.ConsultaAdquisicion(request.AdquisicionId)
                                    .FirstOrDefault();

            if (adquisicionActual == null)
            {
                throw new ArgumentException("La adquisición no existe.");
            }

            // Prepara los valores actuales para la comparación
            var valorInicial = new
            {
                Presupuesto = adquisicionActual.Presupuesto,
                FechaAdquisicion = adquisicionActual.FechaAdquisicion,
                Cantidad = adquisicionActual.Cantidad,
                ValorUnitario = adquisicionActual.ValorUnitario,
                UnidadAdministrativaId = adquisicionActual.UnidadAdministrativaId,
                Activo = adquisicionActual.Activo,
                ProveedorId = adquisicionActual.ProveedorId,
                TipoBienServicio = adquisicionActual.TipoBienServicio
            };

            // Prepara los valores nuevos
            var valorActualizado = new
            {
                Presupuesto = request.Presupuesto,
                FechaAdquisicion = request.FechaAdquisicion,
                Cantidad = request.Cantidad,
                ValorUnitario = request.ValorUnitario,
                UnidadAdministrativaId = request.UnidadAdministrativaId,
                Activo = request.Activo,
                ProveedorId = request.ProveedorId,
                TipoBienServicio = request.TipoBienServicio
            };
            DateTime fechaRegistroHistorial = DateTime.Now;

            if (!valorInicial.Presupuesto.Equals(valorActualizado.Presupuesto))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Presupuesto", valorInicial.Presupuesto.ToString(), valorActualizado.Presupuesto.ToString(), (int)request.AdquisicionId);
            }
            if (!valorInicial.FechaAdquisicion.Equals(valorActualizado.FechaAdquisicion))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Fecha Adquisicion", valorInicial.FechaAdquisicion.ToString("yyyy-MM-dd"), valorActualizado.FechaAdquisicion.ToString("yyyy-MM-dd"), (int)request.AdquisicionId);
            }
            if (!valorInicial.Cantidad.Equals(valorActualizado.Cantidad))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Cantidad", valorInicial.Cantidad.ToString(), valorActualizado.Cantidad.ToString(), (int)request.AdquisicionId);
            }
            if (!valorInicial.ValorUnitario.Equals(valorActualizado.ValorUnitario))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Valor Unitario", valorInicial.ValorUnitario.ToString(), valorActualizado.ValorUnitario.ToString(), (int)request.AdquisicionId);
            }
            if (!valorInicial.UnidadAdministrativaId.Equals(valorActualizado.UnidadAdministrativaId))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Id Unidad Administrativa", valorInicial.UnidadAdministrativaId.ToString(), valorActualizado.UnidadAdministrativaId.ToString(), (int)request.AdquisicionId);
            }
            if (!valorInicial.Activo.Equals(valorActualizado.Activo))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Estado", valorInicial.Activo.ToString(), valorActualizado.Activo.ToString(), (int)request.AdquisicionId);
            }
            if (!valorInicial.ProveedorId.Equals(valorActualizado.ProveedorId))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Proveedor Id", valorInicial.ProveedorId.ToString(), valorActualizado.ProveedorId.ToString(), (int)request.AdquisicionId);
            }
            if (!valorInicial.TipoBienServicio.Equals(valorActualizado.TipoBienServicio))
            {
                _context.InsertHistorialAdquisicion(fechaRegistroHistorial, "Tipo Bien/Servicio", valorInicial.TipoBienServicio.ToString(), valorActualizado.TipoBienServicio.ToString(), (int)request.AdquisicionId);
            }

            _context.UpdateAdquisicion(
                (int)request.AdquisicionId,
                request.Presupuesto,
                request.FechaAdquisicion,
                request.Cantidad,
                request.ValorUnitario,
                request.UnidadAdministrativaId,
                request.Activo,
                request.ProveedorId,
                request.TipoBienServicio
            );

        }

        public void InsertarDocumentacion(DocumentacionAdquisicionDTO request)
        {
            _context.InsertDocumentacionAdquisicion(
                request.Descripcion,
                request.Detalles,
                (int)request.AdquisicionId
            );
        }

        public void InsertarHistorial(HistorialAdquisicionDTO request)
        {
            _context.InsertHistorialAdquisicion(
                request.fechaModificacion,
                request.CambioRealizado,
                request.ValorInicial,
                request.ValorActualizado,
                request.AdquisicionId
            );
        }

        public IEnumerable<sp_consulta_Proveedor> consultaProveedor()
        {
            return _context.consulta_Proveedor();
        }

        public IEnumerable<sp_consulta_TipoServicio> consultaTipoServicio()
        {
            return _context.consulta_TipoServicio();
        }

        public IEnumerable<sp_consulta_UnidadAdministrativa> consultaUnidadAdministrativa()
        {
            return _context.consulta_UnidadAdministrativa();
        }

        public IEnumerable<sp_consulta_DocumentacionAdquisicion> consultaDocumentacionAdquisicion(int idAdquisicion)
        {
            return _context.consulta_DocumentacionAdquisicion(idAdquisicion);
        }

        public IEnumerable<sp_consultaHistorialAdquisicion> consultaHistorialAdquisicion(int idAdquisicion)
        {
            return _context.consultaHistorialAdquisicion( idAdquisicion);
        }
    }
}
