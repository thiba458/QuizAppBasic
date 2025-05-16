import { Component } from '@angular/core';
import { QuizComponent } from "./quiz/quiz.component";
import { HttpClientModule } from '@angular/common/http';
import { ScreenService } from './screen.service';
import { NgIf } from '@angular/common';
import { ResultComponent } from './result/result.component';
@Component({
  selector: 'app-root',
  standalone: true,
  imports: [HttpClientModule, QuizComponent, NgIf, ResultComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  constructor(private ScreenService: ScreenService) {}
  title = 'ui';
  screen: number = 1;
ngOnint() {
    this.screen = this.ScreenService.getScreen();
  }
  changeScreen(screenNo: number) {
    this.ScreenService.setScreen(screenNo);
    this.screen = screenNo;
  }
  endQuiz() {
    this.ScreenService.setScreen(3);
    this.screen = 3;
  }
restartQuiz(){
  
}

}

