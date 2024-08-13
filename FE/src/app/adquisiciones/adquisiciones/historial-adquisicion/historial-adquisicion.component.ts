import { Component, Input, OnChanges, SimpleChanges } from '@angular/core';
import { AdquisicionesServiceService } from 'src/app/shared/services/adquisiciones-service.service';


@Component({
  selector: 'app-historial-adquisicion',
  templateUrl: './historial-adquisicion.component.html',
  styleUrls: ['./historial-adquisicion.component.scss']
})
export class HistorialAdquisicionComponent implements OnChanges {

  constructor(private adquisicionesServiceService: AdquisicionesServiceService) { }

  @Input() idAdquisicionSelect !: number;
  historialAdquisicion: any;
  ngOnChanges(changes: SimpleChanges): void {
    const idAdquisicion = changes['idAdquisicionSelect'].currentValue;
    this.consultaHistorialAdquisicion(idAdquisicion);
  }

  consultaHistorialAdquisicion(idAdquisicion: number) {
    this.adquisicionesServiceService.getHistorialAdquisicionbyId(idAdquisicion).subscribe(data => {
      this.historialAdquisicion = data;
    });

  }
}
