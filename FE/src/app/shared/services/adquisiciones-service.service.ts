import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AdquisicionesCUModel } from 'src/app/models/adquisiciones-cumodel';
import { AdquisicionesModel } from 'src/app/models/adquisiciones-model';
import { DocumentacionAdquisicion } from 'src/app/models/documentacion-adquisicion';
import { HistorialAdquisicion } from 'src/app/models/historial-adquisicion';
import { environment } from 'src/environments/environment';
import { Observable, BehaviorSubject } from 'rxjs';
import { observableToBeFn } from 'rxjs/internal/testing/TestScheduler';

const baseUrl = `${environment.apiUrl}`;

@Injectable({
  providedIn: 'root'
})
export class AdquisicionesServiceService {

  constructor(private http: HttpClient) { }
  
  getProveedores(): Observable<any> {
    return this.http.get<any>(`${baseUrl}/Adquisiciones/Proveedor`);
  }
  getServicios(): Observable<any> {
    return this.http.get<any>(`${baseUrl}/Adquisiciones/Servicio`);
  }
  getUnidadAdm(): Observable<any> {
    return this.http.get<any>(`${baseUrl}/Adquisiciones/UnidadAdm`);
  }
  getAdquisicionesList(): Observable<AdquisicionesModel[]> {
    return this.http.get<AdquisicionesModel[]>(`${baseUrl}/Adquisiciones/Adquisicion`);
  }
  getAdquisicionbyId(idAdquisicion:any): Observable<AdquisicionesModel> {
    return this.http.get<AdquisicionesModel>(`${baseUrl}/Adquisiciones/AdquisicionbyId?idAdquisicion=${idAdquisicion}`);
  }
  getDocumentacionAdquisicionbyId(idAdquisicion:any): Observable<DocumentacionAdquisicion[]> {
    return this.http.get<DocumentacionAdquisicion[]>(`${baseUrl}/Adquisiciones/ConsultarDocumentacion?idAdquisicion=${idAdquisicion}`);
  }

  getHistorialAdquisicionbyId(idAdquisicion:any): Observable<HistorialAdquisicion[]> {
    return this.http.get<HistorialAdquisicion[]>(`${baseUrl}/Adquisiciones/ConsultarHistorial?idAdquisicion=${idAdquisicion}`);
  }
  createAdquisicion(data: AdquisicionesCUModel): Observable<any>{
    return this.http.post(`${baseUrl}/Adquisiciones`, data);
  }
  UpdateAdquisicion(data: AdquisicionesCUModel): Observable<any>{
    return this.http.put(`${baseUrl}/Adquisiciones`, data);
  }
}

