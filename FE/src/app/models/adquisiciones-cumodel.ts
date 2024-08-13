import { DocumentacionAdquisicion } from 'src/app/models/documentacion-adquisicion';

export interface AdquisicionesCUModel {
    adquisicionId?: number;
    presupuesto: number;
    fechaAdquisicion: Date;
    cantidad: number;
    valorUnitario: number;
    unidadAdministrativaId: number;
    activo: boolean;
    proveedorId: number;
    tipoBienServicio: number;
    documentacion?: DocumentacionAdquisicion[];
}