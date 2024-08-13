import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListarComponent } from 'src/app/adquisiciones/adquisiciones/listar/listar.component';

const routes: Routes = [
  { path: '', component: ListarComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdquisicionesRoutingModule { }
