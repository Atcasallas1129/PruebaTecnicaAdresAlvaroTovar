import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { AdquisicionesServiceService } from 'src/app/shared/services/adquisiciones-service.service';
import { AdquisicionesCUModel } from 'src/app/models/adquisiciones-cumodel';
import { DocumentacionAdquisicion } from 'src/app/models/documentacion-adquisicion';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-crear',
  templateUrl: './crear.component.html',
  styleUrls: ['./crear.component.scss']
})
export class CrearComponent implements OnInit {

  @Output() eventoCerrarVentana = new EventEmitter<any>();
  @Output() eventoAlmacenamientoOK = new EventEmitter<any>();


  adquisicion: AdquisicionesCUModel = {
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

  documentacion: DocumentacionAdquisicion={
    descripcion:"",
    detalles:""
  }

  proveedores: any;
  unidadAdministrativa: any;
  servicios: any;

  constructor(private adquisicionesServiceService: AdquisicionesServiceService) { }
  ngOnInit(): void {
    this.onConsultaProveedores();
    this.onConsultaServicio();
    this.onConsultaUnidadAdministrativa();
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

  onAlmacenamientoOk(){
    this.eventoAlmacenamientoOK.emit()
  }

  onAlmacenarAdquisicion() {
    let mensaje: string = "";
    let proceso : boolean = true;
    
    if(this.adquisicion.presupuesto == 0){
      proceso = false;
      mensaje += "<li>El presupuesto debe superior a 0</li>"
    }
    if(!this.adquisicion.fechaAdquisicion){
      proceso = false;
      mensaje += "<li>La fecha de la adquisición no puede estar vacía</li>"
    }
    if(this.adquisicion.cantidad == 0){
      proceso = false;
      mensaje += "<li>La cantidad debe superior a 0</li>"
    }
    if(this.adquisicion.valorUnitario == 0){
      proceso = false;
      mensaje += "<li>el Valor unitario debe superior a 0</li>"
    }

    if(this.adquisicion.unidadAdministrativaId == 0){
      proceso = false;
      mensaje += "<li>Seleccione una unidad Administrativa</li>"
    }
    if(this.adquisicion.proveedorId == 0){
      proceso = false;
      mensaje += "<li>Seleccione un proveedor</li>"
    }
    if(this.adquisicion.tipoBienServicio == 0){
      proceso = false;
      mensaje += "<li>Seleccione un bien o servicio</li>"
    }

    if(this.adquisicion.documentacion?.length == 0){
      proceso = false;
      mensaje += "<li>Debe indicar al menos un item asociado a la Documentación de la adquisición</li>"
    }

    if(proceso){
      this.adquisicionesServiceService.createAdquisicion(this.adquisicion).subscribe(data=>{
        console.log(data);
        Swal.fire("Almacenamiento Exitoso", "se almacenó exitosamente la adquisición bajo el identificador "+data.adquisicionId.toString(), 'success');
        this.onAlmacenamientoOk();
      });
    }
    else{
      Swal.fire("Error en Validación", "Debe validar los siguientes ítems: "+mensaje, 'error');
    }
  }

  almacenarDocumentacion() {

    let mensaje:string = "";
    let validacion : boolean= true;

    if(this.documentacion.descripcion.length == 0 || this.documentacion.detalles.length == 0){
      mensaje = "Debe diligeciar la Descrición y el Detalle de la documentación";
      validacion = false;
    }
    if(validacion){
      const doc: DocumentacionAdquisicion = {
        descripcion: this.documentacion.descripcion,
        detalles: this.documentacion.detalles
      };
  
      this.adquisicion.documentacion?.push(doc);
    
      this.documentacion = {
        descripcion: "",
        detalles: ""
      };
    }
    else{
      Swal.fire("Error Validación", mensaje, 'error');
    }
  }

}
