import { Injectable } from '@angular/core';
import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import Swal from 'sweetalert2';

@Injectable()
export class HttpInterceptorService implements HttpInterceptor {

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = localStorage.getItem('authToken');
    let clonedReq = req;

    if (token) {
      clonedReq = req.clone({
        headers: req.headers.set('Authorization', `Bearer ${token}`)
      });
    }

    return next.handle(clonedReq).pipe(
      catchError((error: HttpErrorResponse) => {
        let errorMsg = '';
        if (error.error instanceof ErrorEvent) {
          // Error del lado del cliente
          errorMsg = `Error: ${error.error.message}`;
        } else {
          // Error del lado del servidor
          const errorMessage = error.error.message || 'An unexpected error occurred';
          if (error.status === 404) {
            Swal.fire({
              icon: 'warning',
              title: 'Not Found',
              text: errorMessage,
              footer: '<a href="#">¿Necesitas ayuda?</a>'
            });
          } else if (error.status === 550 || error.status === 500) {
            Swal.fire({
              icon: 'error',
              title: 'Error',
              text: errorMessage,
              footer: '<a href="#">¿Necesitas ayuda?</a>'
            });
          } else {
            errorMsg = `Error Code: ${error.status}\nMessage: ${error.message}`;
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: errorMsg,
              footer: '<a href="#">¿Necesitas ayuda?</a>'
            });
          }
        }

        return throwError(() => new Error(errorMsg));
      })
    );
  }
}