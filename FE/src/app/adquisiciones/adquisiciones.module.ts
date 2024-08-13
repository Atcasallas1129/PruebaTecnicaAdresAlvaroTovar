import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdquisicionesRoutingModule } from './adquisiciones-routing.module';
import { ListarComponent } from './adquisiciones/listar/listar.component';
import { CrearComponent } from './adquisiciones/crear/crear.component';
import { EditarComponent } from './adquisiciones/editar/editar.component';
import { DetalleComponent } from './adquisiciones/detalle/detalle.component';
import { FormsModule } from '@angular/forms';
import { HistorialAdquisicionComponent } from './adquisiciones/historial-adquisicion/historial-adquisicion.component';


@NgModule({
  declarations: [
    ListarComponent,
    CrearComponent,
    EditarComponent,
    DetalleComponent,
    HistorialAdquisicionComponent
  ],
  imports: [
    CommonModule,
    AdquisicionesRoutingModule,
    FormsModule
  ]
})
export class AdquisicionesModule { }
