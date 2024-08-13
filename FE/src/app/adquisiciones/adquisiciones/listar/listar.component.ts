import { Component, OnInit } from '@angular/core';
import { AdquisicionesServiceService } from 'src/app/shared/services/adquisiciones-service.service';
import { AdquisicionesModel } from 'src/app/models/adquisiciones-model';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.scss']
})
export class ListarComponent implements OnInit {
  constructor(
    private AdquisicionesServiceService: AdquisicionesServiceService
  ) { }

  isSlideVisible: boolean = false;
  //Generacion Elementos de filtros.
  adquisicionesList: AdquisicionesModel[] = [];
  filteredList: AdquisicionesModel[] = [];
  idAdquisicionSelect!: number;

  // Paginación
  currentPage = 1;
  itemsPerPage = 10;

  // variables de gestión
  crearAdquisicion: boolean = false;
  editarAdquisicion: boolean = false;
  detalleAdquisicion: boolean = false;


  ngOnInit(): void {
    this.onConsultaAdquisiciones();
  }

  onConsultaAdquisiciones() {
    this.AdquisicionesServiceService.getAdquisicionesList().subscribe(data => {
      this.adquisicionesList = data;
    });
  }

  // Función para cambiar de página
  onPageChange(pageNumber: number) {
    this.currentPage = pageNumber;
  }

  // Función para cambiar la cantidad de elementos por página
  onItemsPerPageChange(event: Event) {
    const target = event.target as HTMLSelectElement;
    this.itemsPerPage = parseInt(target.value, 10) === -1 ? this.adquisicionesList.length : parseInt(target.value, 10);
    this.currentPage = 1; // Reiniciar a la primera página al cambiar el número de elementos por página
  }

  // Filtro del objeto por cantidad de rgistros por pagina
  get paginatedList() {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    const endIndex = startIndex + this.itemsPerPage;
    return this.adquisicionesList.slice(startIndex, endIndex);
  }

  onCrearAdquisicion() {
    this.isSlideVisible = true;
    this.detalleAdquisicion = false;
    this.editarAdquisicion = false;
    this.crearAdquisicion = true;
  }

  onDetalleAdquisicion(adquisicion: any) {
    this.isSlideVisible = true;
    this.detalleAdquisicion = true;
    this.editarAdquisicion = false;
    this.crearAdquisicion = false;
    this.idAdquisicionSelect = adquisicion.adquisicionId;
  }

  onEditarAdquisicion(adquisicion: any) {
    this.isSlideVisible = true;
    this.detalleAdquisicion = false;
    this.editarAdquisicion = true;
    this.crearAdquisicion = false;
    this.idAdquisicionSelect = adquisicion.adquisicionId;
  }

  recibirAlmacenamiento() {
    this.recibirAccionCerrar();
    this.onConsultaAdquisiciones();
  }
  recibirAccionCerrar() {
    this.isSlideVisible = false;
  }


}