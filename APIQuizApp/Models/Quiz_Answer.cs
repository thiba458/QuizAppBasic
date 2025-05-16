using System.ComponentModel.DataAnnotations;

namespace APIQuizApp.Models
{
    public class Quiz_Answer
    {
        [Key]
        public int QuizAnswerId { get; set; }
        public int QuestionId { get; set; }
        public int SelectedAnswer { get; set; }
        public bool IsCorrect { get; set; }
    }

}
