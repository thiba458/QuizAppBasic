import { Component, EventEmitter, Output } from '@angular/core';
import { QuestionService } from '../question.service';
import { NgClass, NgFor, NgIf } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { QuizAnswer } from '../model';
import { ScreenService } from '../screen.service';
import { Subscription, timer } from 'rxjs';

@Component({
  selector: 'app-quiz',
  standalone: true,
  imports: [NgClass, NgFor, NgIf],
  templateUrl: './quiz.component.html',
  styleUrl: './quiz.component.scss'
})
export class QuizComponent {
  constructor(private QuestionService: QuestionService,
    private ScreenService: ScreenService
  ) {
  }
  questions: any;
  currentQuestion: any;
  questionNo: number = 1;
  numberQuestion: any;
  checkQues: boolean = false;
  curentAnswers: Array<any> = new Array().fill(null);
  answerCheck: any;
  iCheckAnwser: boolean = false;
  selectedAnswer: string = '';
  isCheckedAnswer: boolean = false;
  newAnswer: QuizAnswer = { questionId: 0, answerId: 0 }
  quizAnswers = this.QuestionService.quizAnswers;
  @Output('endQuiz') endQuiz: EventEmitter<any> = new EventEmitter();
  timeElapsed: number = 0; // Thời gian trôi qua (giây)
  timerDisplay = this.QuestionService.timerDisplay;
  timerSubscription: Subscription | null = null;
  ngOnInit() {
    this.getAllQuestion();
  }
  // GET all question and answer
  getAllQuestion() {
    this.QuestionService.getAllQuestion().subscribe(
      (data) => {
        this.questions = data;
        this.numberQuestion = data.length;
        this.curentAnswers = new Array(this.numberQuestion).fill(null);
        this.setCurrentQuestion(0);
        this.checkQues = false;
        this.startTimer();

      },
      err => console.log(err)
    )
  }
  setCurrentQuestion(index: number) {
    this.questionNo = index;
    this.currentQuestion = this.questions[this.questionNo];

  }
  setAnswer(index: number, i: number, answerId: number, questionId: number) {
    this.curentAnswers[index] = i;
    this.newAnswer.questionId = questionId;
    this.newAnswer.answerId = answerId;

    const indexAs = this.quizAnswers.findIndex(a => a.questionId === questionId);
    if (indexAs !== -1) {
      this.quizAnswers[indexAs] = { questionId, answerId }
    } else {
      this.QuestionService.setAnswer(this.newAnswer);
    }
  }
  prevQue() {
    this.iCheckAnwser = false;
    if (this.questionNo > 0) {
      this.questionNo -= 1;
      this.setCurrentQuestion(this.questionNo)
    }
  }
  nextQue() {
    this.iCheckAnwser = false;
    if (this.questionNo +1 < this.questions.length) {
      this.questionNo += 1;
      this.setCurrentQuestion(this.questionNo)
    }

  }
  CheckedAnswer() {
    if (this.curentAnswers[this.questionNo + 1] != null) {
      this.isCheckedAnswer = true;
    }
    else this.isCheckedAnswer = false;
  }

  checkAnswers(questionId: any) {
    console.log(this.currentQuestion)
    this.QuestionService.checkAnswerByQuestionId(questionId).subscribe(
      (data) => {
        this.currentQuestion = data[0];
        console.log(data[0]);
        this.iCheckAnwser = true;
      },
      err => console.log(err)
    )
  }

  submit() {
    this.QuestionService.postAnswer().subscribe(
      (data) => {
        this.QuestionService.result = data;
        this.endQuiz.emit();
      },
      err => console.log(err)
    );
  }
  startTimer(): void {
    this.timerSubscription = timer(0, 1000).subscribe(() => {
      this.timeElapsed++;
      this.updateTimerDisplay();
    });
  }
  updateTimerDisplay(): void {
    const minutes = Math.floor(this.timeElapsed / 60);
    const seconds = this.timeElapsed % 60;
    this.timerDisplay = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    this.QuestionService.timerDisplay = this.timerDisplay;
  }
}
