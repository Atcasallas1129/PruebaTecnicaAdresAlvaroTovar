using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace PruebaTecnicaAdres.Data
{
    public class ProjectDbContext : DbContext
    {
        public ProjectDbContext(DbContextOptions<ProjectDbContext> options)
            : base(options)
        {
        }

        #region Declaración de métodos
        public virtual DbSet<sp_consulta_UnidadAdministrativa> sp_consulta_UnidadAdministrativa { get; set; } = null;
        public virtual DbSet<sp_consulta_Proveedor> sp_consulta_Proveedor { get; set; } = null;
        public virtual DbSet<sp_consulta_TipoServicio> sp_consulta_TipoServicio { get; set; } = null;
        public virtual DbSet<sp_consulta_Adquisicion> sp_consulta_Adquisicion { get; set; } = null;
        public virtual DbSet<sp_consulta_DocumentacionAdquisicion> sp_consulta_DocumentacionAdquisicion { get; set; } = null;
        public virtual DbSet<sp_insertAdquisicion> sp_insertAdquisicion { get; set; } = null;
        public virtual DbSet<sp_consultaHistorialAdquisicion> sp_consultaHistorialAdquisicion { get; set; } = null;
        


        #endregion

        #region Implementacion de métodos
        public IEnumerable<sp_consulta_UnidadAdministrativa> consulta_UnidadAdministrativa()
        {
            return this.sp_consulta_UnidadAdministrativa.FromSqlInterpolated($"sp_consulta_UnidadAdministrativa").ToArray();
        }
        public IEnumerable<sp_consulta_Proveedor> consulta_Proveedor()
        {
            return this.sp_consulta_Proveedor.FromSqlInterpolated($"sp_consulta_Proveedor").ToArray();
        }
        public IEnumerable<sp_consulta_TipoServicio> consulta_TipoServicio()
        {
            return this.sp_consulta_TipoServicio.FromSqlInterpolated($"sp_consulta_TipoServicio").ToArray();
        }
        public IEnumerable<sp_consulta_Adquisicion> ConsultaAdquisicion(int? idAdquisicion)
        {
            var idParam = idAdquisicion.HasValue
                ? new SqlParameter("@idAdquisicion", idAdquisicion.Value)
                : new SqlParameter("@idAdquisicion", DBNull.Value);

            return this.sp_consulta_Adquisicion
                       .FromSqlRaw("EXEC sp_consulta_Adquisicion @idAdquisicion", idParam)
                       .ToArray();
        }

        public IEnumerable<sp_consultaHistorialAdquisicion> consultaHistorialAdquisicion(int idAdquisicion)
        {
            var idParam = new SqlParameter("@idAdquisicion", idAdquisicion);

            return this.sp_consultaHistorialAdquisicion
                       .FromSqlRaw("EXEC sp_consultaHistorialAdquisicion @idAdquisicion", idParam)
                       .ToArray();
        }

        public IEnumerable<sp_consulta_DocumentacionAdquisicion> consulta_DocumentacionAdquisicion(int idAdquisicion)
        {
            return this.sp_consulta_DocumentacionAdquisicion.FromSqlInterpolated($"sp_consulta_DocumentacionAdquisicion {idAdquisicion}").ToArray();
        }
        public sp_insertAdquisicion InsertAdquisicion(decimal presupuesto, int cantidad, decimal valorUnitario, DateTime fechaAdquisicion, int unidadAdministrativaId, int proveedorId, int tipoBienServicio)
        {
            var presupuestoParam = new SqlParameter("@Presupuesto", SqlDbType.Money) { Value = presupuesto };
            var cantidadParam = new SqlParameter("@Cantidad", SqlDbType.Int) { Value = cantidad };
            var valorUnitarioParam = new SqlParameter("@ValorUnitario", SqlDbType.Money) { Value = valorUnitario };
            var fechaAdquisicionParam = new SqlParameter("@FechaAdquisicion", SqlDbType.DateTime) { Value = fechaAdquisicion };
            var unidadAdministrativaIdParam = new SqlParameter("@UnidadAdministrativaId", SqlDbType.Int) { Value = unidadAdministrativaId };
            var proveedorIdParam = new SqlParameter("@ProveedorId", SqlDbType.Int) { Value = proveedorId };
            var tipoBienServicioParam = new SqlParameter("@TipoBienServicio", SqlDbType.Int) { Value = tipoBienServicio };

            return sp_insertAdquisicion.FromSqlRaw("EXEC sp_insertAdquisicion @Presupuesto, @Cantidad, @ValorUnitario, @FechaAdquisicion, @UnidadAdministrativaId, @ProveedorId, @TipoBienServicio",
                                                  presupuestoParam, cantidadParam, valorUnitarioParam, fechaAdquisicionParam, unidadAdministrativaIdParam, proveedorIdParam, tipoBienServicioParam)
                                                  .AsEnumerable()
                                                  .FirstOrDefault();
        }
        public void InsertDocumentacionAdquisicion(string descripcion, string detalles, int adquisicionId)
        {
            var descripcionParam = new SqlParameter("@Descripcion", SqlDbType.NVarChar, 255) { Value = descripcion };
            var detallesParam = new SqlParameter("@Detalles", SqlDbType.NVarChar, -1) { Value = detalles };
            var adquisicionIdParam = new SqlParameter("@AdquisicionId", SqlDbType.Int) { Value = adquisicionId };

            this.Database.ExecuteSqlRaw("EXEC sp_insertDocumentacionAdquisicion @Descripcion, @Detalles, @AdquisicionId",
                                        descripcionParam, detallesParam, adquisicionIdParam);
        }
        public void UpdateAdquisicion(int adquisicionId, decimal presupuesto, DateTime fechaAdquisicion, int cantidad, decimal valorUnitario, int unidadAdministrativaId, bool activo, int proveedorId, int tipoBienServicio)
        {
            var adquisicionIdParam = new SqlParameter("@AdquisicionId", adquisicionId);
            var presupuestoParam = new SqlParameter("@Presupuesto", presupuesto);
            var fechaAdquisicionParam = new SqlParameter("@fechaAdquisicion", fechaAdquisicion);
            var cantidadParam = new SqlParameter("@Cantidad", cantidad);
            var valorUnitarioParam = new SqlParameter("@ValorUnitario", valorUnitario);
            var unidadAdministrativaIdParam = new SqlParameter("@UnidadAdministrativaId", unidadAdministrativaId);
            var activoParam = new SqlParameter("@Activo", activo);
            var proveedorIdParam = new SqlParameter("@ProveedorId", proveedorId);
            var tipoBienServicioParam = new SqlParameter("@TipoBienServicio", tipoBienServicio);

            Database.ExecuteSqlRaw("EXEC sp_UpdateAdquisicion @AdquisicionId, @Presupuesto, @fechaAdquisicion, @Cantidad, @ValorUnitario, @UnidadAdministrativaId, @Activo, @ProveedorId, @TipoBienServicio",
                adquisicionIdParam, presupuestoParam, fechaAdquisicionParam, cantidadParam, valorUnitarioParam, unidadAdministrativaIdParam, activoParam, proveedorIdParam, tipoBienServicioParam);
        }

        public void InsertHistorialAdquisicion(DateTime fechaRegistro, string cambioRealizado, string? valorInicial, string? valorActualizado, int adquisicionId)
        {
            var fechaRegistroParam = new SqlParameter("@fechaModificacion", SqlDbType.DateTime)
            {
                Value = fechaRegistro
            };
            var cambioRealizadoParam = new SqlParameter("@cambioRealizado", cambioRealizado);
            var valorInicialParam = new SqlParameter("@valorInicial", SqlDbType.NVarChar)
            {
                Value = valorInicial ?? (object)DBNull.Value
            };

            var valorActualizadoParam = new SqlParameter("@valorActualizado", SqlDbType.NVarChar)
            {
                Value = valorActualizado ?? (object)DBNull.Value
            };
            var adquisicionIdParam = new SqlParameter("@AdquisicionId", adquisicionId);

            Database.ExecuteSqlRaw("EXEC sp_historial_adquisicion @fechaModificacion, @cambioRealizado, @valorInicial, @valorActualizado, @AdquisicionId",
                fechaRegistroParam, cambioRealizadoParam, valorInicialParam, valorActualizadoParam, adquisicionIdParam);
        }

        #endregion
    }
}
