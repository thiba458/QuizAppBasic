using System.ComponentModel.DataAnnotations;

namespace APIQuizApp.Models
{
    public class ModelViews
    {

    }
    public class QuizAnswer()
    {
        public int QuestionId { get; set; }
        public int AnswerId { get; set; }
        public int SelectedAnswer { get; set; }
    }
    public class UserAnswers
    {
        public int QuestionId { get; set; }
        public string? QuestionText { get; set; }
        public string? Explain { get; set; }
        public int SelectedAnswer { get; set; }
        public int QuestionAnswer { get; set; }
        public bool IsCorrect { get; set; }
        public string? TextAnswer { get; set; }
        public string? TextUser { get; set; }
    }
    public class SubmitAnswerResponse
    {
        public int TotalQuestions { get; set; }
        public int CorrectCount { get; set; }
        public List<UserAnswers> Details { get; set; }
    }
}
