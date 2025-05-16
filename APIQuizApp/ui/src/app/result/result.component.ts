import { Component, EventEmitter, Output } from '@angular/core';
import { QuestionService } from '../question.service';
import { NgClass, NgFor, NgIf } from '@angular/common';
import { UserAnswer } from '../model';
@Component({
  selector: 'app-result',
  standalone: true,
  imports: [ NgFor, NgIf],
  templateUrl: './result.component.html',
  styleUrl: './result.component.scss'
})
export class ResultComponent {
  questions: Array<any> = [];
  correctAnswers: Array<number> = [];
  answers: Array<any> = [];
  correctCount: number = 0;
  totalQuestions: number = 0;
  isPass: boolean=false;
  result: any;
  userAnswers: UserAnswer[]=[]
  timerDisplay = this.QuestionsService.timerDisplay;
  @Output('restartQuiz') restartQuiz: EventEmitter<any> = new EventEmitter();
  constructor(private QuestionsService: QuestionService) { }
  ngOnInit() {
    this.result = this.QuestionsService.result
    console.log(this.userAnswers)
    this.correctCount = this.result.correctCount
    this.totalQuestions = this.result.totalQuestions
    this.userAnswers = this.result.details
    console.log(this.userAnswers)
    if(this.correctCount/this.result.totalQuestions*100 > 80){
    this.isPass = true;
    }
  }
  reload() {
    window.location.reload();
  }
}
