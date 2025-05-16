export interface QuizAnswer {
  questionId?: number,
  answerId?: number,
  selectedAnswer?: boolean
}

export interface UserAnswer {
  questionId?: number,
  questionText?: string,
  isCorrect?: boolean,
  selectedAnswer?:number,
  textAnswer? : string,
  textUser? : string
  explain?: string

}