import { TestBed } from '@angular/core/testing';

import { AdquisicionesServiceService } from './adquisiciones-service.service';

describe('AdquisicionesServiceService', () => {
  let service: AdquisicionesServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AdquisicionesServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
