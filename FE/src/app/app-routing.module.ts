import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'adquisiciones',
    loadChildren: () => import('./adquisiciones/adquisiciones.module').then(m => m.AdquisicionesModule)
  },
  { path: '', redirectTo: '/adquisiciones', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }