import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { AdquisicionesServiceService } from 'src/app/shared/services/adquisiciones-service.service';
import { AdquisicionesCUModel } from 'src/app/models/adquisiciones-cumodel';
import { DocumentacionAdquisicion } from 'src/app/models/documentacion-adquisicion';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-editar',
  templateUrl: './editar.component.html',
  styleUrls: ['./editar.component.scss']
})
export class EditarComponent implements OnInit, OnChanges {

  @Input() idAdquisicionSelect!: number;
  @Output() eventoCerrarVentana = new EventEmitter<any>();
  @Output() eventoAlmacenamientoOK = new EventEmitter<any>();


  adquisicionCU: AdquisicionesCUModel = {
    adquisicionId: undefined,
    presupuesto: 0,
    fechaAdquisicion: new Date(),
    cantidad: 0,
    valorUnitario: 0,
    unidadAdministrativaId: 0,
    activo: true,
    proveedorId: 0,
    tipoBienServicio: 0,
    documentacion: []
  };

  documentacion: DocumentacionAdquisicion = {
    descripcion: "",
    detalles: ""
  }

  proveedores: any;
  unidadAdministrativa: any;
  servicios: any;

  detalleAdquisicion: any;

  constructor(private adquisicionesServiceService: AdquisicionesServiceService) { }
  ngOnInit(): void {
    this.onConsultaProveedores();
    this.onConsultaServicio();
    this.onConsultaUnidadAdministrativa();
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['idAdquisicionSelect'] && changes['idAdquisicionSelect'].currentValue !== changes['idAdquisicionSelect'].previousValue) {
      const idAdquisicion = changes['idAdquisicionSelect'].currentValue;
      this.consultaDetalleAdquisicion(idAdquisicion);
    }
  }

  consultaDetalleAdquisicion(idAdquisicion: number) {
    this.adquisicionesServiceService.getAdquisicionbyId(idAdquisicion).subscribe(data => {
      this.detalleAdquisicion = data;
    });

    this.adquisicionesServiceService.getDocumentacionAdquisicionbyId(idAdquisicion).subscribe(data => {
      this.adquisicionCU.adquisicionId = idAdquisicion;
      this.adquisicionCU.documentacion = data;

      console.log("elemento mapeado", this.adquisicionCU.adquisicionId = idAdquisicion);
    });

  }
  onConsultaProveedores() {
    this.adquisicionesServiceService.getProveedores().subscribe(data => { this.proveedores = data; });
  }
  onConsultaServicio() {
    this.adquisicionesServiceService.getServicios().subscribe(data => { this.servicios = data; });
  }
  onConsultaUnidadAdministrativa() {
    this.adquisicionesServiceService.getUnidadAdm().subscribe(data => { this.unidadAdministrativa = data; });
  }

  eventoCancelarEmit() {
    this.eventoCerrarVentana.emit();
  }

  onAlmacenamientoOk() {
    this.eventoAlmacenamientoOK.emit()
  }

  onAlmacenarAdquisicion() {
    let mensaje: string = "";
    let proceso: boolean = true;

    if (this.detalleAdquisicion.presupuesto == 0) {
      proceso = false;
      mensaje += "<li>El presupuesto debe superior a 0</li>"
    }
    if (!this.detalleAdquisicion.fechaAdquisicion) {
      proceso = false;
      mensaje += "<li>La fecha de la adquisición no puede estar vacía</li>"
    }
    if (this.detalleAdquisicion.cantidad == 0) {
      proceso = false;
      mensaje += "<li>La cantidad debe superior a 0</li>"
    }
    if (this.detalleAdquisicion.valorUnitario == 0) {
      proceso = false;
      mensaje += "<li>el Valor unitario debe superior a 0</li>"
    }

    if (this.detalleAdquisicion.unidadAdministrativaId == 0) {
      proceso = false;
      mensaje += "<li>Seleccione una unidad Administrativa</li>"
    }
    if (this.detalleAdquisicion.proveedorId == 0) {
      proceso = false;
      mensaje += "<li>Seleccione un proveedor</li>"
    }
    if (this.detalleAdquisicion.tipoBienServicio == 0) {
      proceso = false;
      mensaje += "<li>Seleccione un bien o servicio</li>"
    }

    if (this.adquisicionCU.documentacion?.length == 0) {
      proceso = false;
      mensaje += "<li>Debe indicar al menos un item asociado a la Documentación de la adquisición</li>"
    }

    if (proceso) {
      this.adquisicionCU.adquisicionId = this.idAdquisicionSelect;
      this.adquisicionCU.presupuesto = this.detalleAdquisicion.presupuesto;
      this.adquisicionCU.fechaAdquisicion = this.detalleAdquisicion.fechaAdquisicion;
      this.adquisicionCU.cantidad = this.detalleAdquisicion.cantidad;
      this.adquisicionCU.valorUnitario = this.detalleAdquisicion.valorUnitario;
      this.adquisicionCU.unidadAdministrativaId = this.detalleAdquisicion.unidadAdministrativaId;
      this.adquisicionCU.proveedorId = this.detalleAdquisicion.proveedorId;
      this.adquisicionCU.tipoBienServicio = this.detalleAdquisicion.tipoBienServicio;
      console.log("elemento update", this.adquisicionCU);


      this.adquisicionesServiceService.UpdateAdquisicion(this.adquisicionCU).subscribe(data => {
        console.log(data);
        Swal.fire("Actualizacion Exitosa", "se actualizó exitosamente la adquisición ", 'success');
      });
    }
    else {
      Swal.fire("Error en Validación", "Debe validar los siguientes ítems: " + mensaje, 'error');
    }
  }

  almacenarDocumentacion() {

    let mensaje: string = "";
    let validacion: boolean = true;

    if (this.documentacion.descripcion.length == 0 || this.documentacion.detalles.length == 0) {
      mensaje = "Debe diligeciar la Descrición y el Detalle de la documentación";
      validacion = false;
    }
    if (validacion) {
      const doc: DocumentacionAdquisicion = {
        descripcion: this.documentacion.descripcion,
        detalles: this.documentacion.detalles
      };

      this.adquisicionCU.documentacion?.push(doc);

      this.documentacion = {
        descripcion: "",
        detalles: ""
      };
    }
    else {
      Swal.fire("Error Validación", mensaje, 'error');
    }
  }

}
