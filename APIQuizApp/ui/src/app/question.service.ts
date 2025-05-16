
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { QuizAnswer } from './model';
@Injectable({
  providedIn: 'root'
})
export class QuestionService {

  quizAnswers: QuizAnswer[] = [];
  result: any[] = [];
  timerDisplay: string = '00:00';
  constructor(private http: HttpClient) { }
  baseApi = "https://localhost:7275/api/";

  // Question   
  // 1. get all question
  getAllQuestion(): Observable<any> {
    return this.http.get<any>(this.baseApi + "Questions");
  }

  // Answer
  // 1. save anwser include: questionID , AnswerId, CorrectAnswer.
  setAnswer(answer: any) {
    this.quizAnswers.push({ ...answer })
  }
  // 2. send answers to server
  postAnswer(): Observable<any> {
    return this.http.post<any>(this.baseApi + "Questions", this.quizAnswers)
  }
  // 3. Check Answer
  checkAnswerByQuestionId(questionId: number): Observable<any> {
    return this.http.get<any>(this.baseApi + "Questions/id?id=" + questionId )
  }
}
