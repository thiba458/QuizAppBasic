using Microsoft.EntityFrameworkCore;
using APIQuizApp.Models;
namespace APIQuizApp.DataContext
{
    public class QuizAppContext : DbContext
    {
        public QuizAppContext(DbContextOptions<QuizAppContext> options) : base(options)
        {

        }
        public DbSet<APIQuizApp.Models.Question> Question { get; set; } = default!;
        public DbSet<APIQuizApp.Models.Answer> Answer { get; set; } = default!;
        public DbSet<APIQuizApp.Models.Quiz_Answer> Quiz_Answer { get; set; } = default!;

    }
}
