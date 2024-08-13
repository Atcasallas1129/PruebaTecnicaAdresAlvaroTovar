using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PruebaTecnicaAdres.Models;
using PruebaTecnicaAdres.Services;

namespace PruebaTecnicaAdres.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AdquisicionesController : Controller
    {
        private readonly IAdquisiciones _adquisicionService;

        public AdquisicionesController(IAdquisiciones adquisicionService)
        {
            _adquisicionService = adquisicionService;
        }

        [HttpGet("Adquisicion")]
        public IActionResult ConsultarAdquisicion()
        {
            var result = _adquisicionService.ConsultarAdquisicion(null);
            if (result.Count() > 0)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest("No existen adquisiciones registradas");
            }
        }

        [HttpGet("AdquisicionbyId")]
        public IActionResult ConsultarAdquisicionbyId(int idAdquisicion)
        {
            var result = _adquisicionService.ConsultarAdquisicion(idAdquisicion).FirstOrDefault();
            if (result != null)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest("La Adquisicion solicitada no existe");
            }
        }

        [HttpGet("Proveedor")]
        public IActionResult ConsultarProveedor()
        {
            var result = _adquisicionService.consultaProveedor();
            return Ok(result);
        }

        [HttpGet("Servicio")]
        public IActionResult ConsultarServicio()
        {
            var result = _adquisicionService.consultaTipoServicio();
            return Ok(result);
        }
        [HttpGet("UnidadAdm")]
        public IActionResult ConsultarUnidadAdm()
        {
            var result = _adquisicionService.consultaUnidadAdministrativa();
            return Ok(result);
        }
        [HttpGet("ConsultarDocumentacion")]
        public IActionResult ConsultarDocumentacion(int idAdquisicion)
        {
            var result = _adquisicionService.consultaDocumentacionAdquisicion(idAdquisicion);
            return Ok(result);
        }

        [HttpGet("ConsultarHistorial")]
        public IActionResult ConsultarHistorial(int idAdquisicion)
        {
            var result = _adquisicionService.consultaHistorialAdquisicion(idAdquisicion);
            return Ok(result);
        }

        [HttpPost]
        public IActionResult InsertarAdquisicion([FromBody] AdquisicionDTO request)
        {
            try
            {
                var result = _adquisicionService.InsertarAdquisicion(request);
                HistorialAdquisicionDTO historial = new HistorialAdquisicionDTO
                {
                    fechaModificacion = DateTime.Now,
                    AdquisicionId = result.AdquisicionId,
                    CambioRealizado = "Creación Inicial Adquisición"

                };

                foreach (var documentacion in request.documentacion)
                {
                    DocumentacionAdquisicionDTO document = new DocumentacionAdquisicionDTO
                    {
                        Descripcion = documentacion.Descripcion,
                        Detalles = documentacion.Detalles,
                        AdquisicionId = result.AdquisicionId,
                    };
                    _adquisicionService.InsertarDocumentacion(document);                    
                }
                _adquisicionService.InsertarHistorial(historial);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        public IActionResult ActualizarAdquisicion([FromBody] AdquisicionDTO request)
        {
            try
            {
                _adquisicionService.ActualizarAdquisicion(request);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("documentacion")]
        public IActionResult InsertarDocumentacion([FromBody] DocumentacionAdquisicionDTO request)
        {
            try{
                _adquisicionService.InsertarDocumentacion(request);
                return Ok();
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
