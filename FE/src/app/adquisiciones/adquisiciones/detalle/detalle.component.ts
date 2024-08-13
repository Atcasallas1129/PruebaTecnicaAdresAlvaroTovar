import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { AdquisicionesServiceService } from 'src/app/shared/services/adquisiciones-service.service';
import { AdquisicionesCUModel } from 'src/app/models/adquisiciones-cumodel';
import { DocumentacionAdquisicion } from 'src/app/models/documentacion-adquisicion';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-detalle',
  templateUrl: './detalle.component.html',
  styleUrls: ['./detalle.component.scss']
})
export class DetalleComponent implements OnChanges {

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
      this.adquisicionCU.documentacion = data;
    });

  }
  eventoCancelarEmit() {
    this.eventoCerrarVentana.emit();
  }
}
