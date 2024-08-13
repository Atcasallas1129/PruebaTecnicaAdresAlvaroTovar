export interface AdquisicionesModel {
    adquisicionId: number;
    presupuesto: number;
    cantidad: number;
    valorUnitario: number;
    valorTotal: number;
    activo: boolean;
    fechaAdquisicion: Date;
    unidadAdministrativaId: number;
    unidadAdministrativaNombre: string;
    proveedorId: number;
    proveedorNombre: string;
    tipoBienServicio: number;
    tipoServicioNombre: string;
}
