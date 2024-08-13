import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HistorialAdquisicionComponent } from './historial-adquisicion.component';

describe('HistorialAdquisicionComponent', () => {
  let component: HistorialAdquisicionComponent;
  let fixture: ComponentFixture<HistorialAdquisicionComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [HistorialAdquisicionComponent]
    });
    fixture = TestBed.createComponent(HistorialAdquisicionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
