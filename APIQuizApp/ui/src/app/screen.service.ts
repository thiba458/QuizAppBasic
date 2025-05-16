import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ScreenService {

  constructor() { }
  public screenNo: number = 1;

  setScreen(value: number) {
    this.screenNo = value;
  }
  getScreen() {
    return this.screenNo;
  }
}

