using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using APIQuizApp.DataContext;
using APIQuizApp.Models;

namespace APIQuizApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionsController : ControllerBase
    {
        private readonly QuizAppContext _context;

        public QuestionsController(QuizAppContext context)
        {
            _context = context;
        }
        
        // GET Questions and Anwers: api/Questions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Object>>> GetQuestion()
        {
           
            var questionsList =await _context.Question
                          .Select(q => new
                          {
                              q.QuestionId,
                              q.Text,
                               Answers = _context.Answer
                              .Where(m => m.QuestionId == q.QuestionId)
                              .Select(m => new
                              {
                                  m.AnswerId,                                 
                                  m.Text,
                              }).ToList()
                          }).ToListAsync();

            return questionsList;
        }


        // POST: api/Questions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<QuizAnswer>> PostQuestion(List<QuizAnswer> quiz_Answer)
        {

            if (quiz_Answer.Count > 0)
            {
                var answerList = new List<UserAnswers>();
                int correctCount = 0;
                // lấy tất cả đáp án đúng từ DB
                var correctAnswers = await _context.Answer                 
                    .Select(a => new
                    {
                        a.QuestionId,
                        a.AnswerId,
                        a.CorrectAnser,
                        a.Text              
                    } 
                    ).OrderBy(m =>m.QuestionId).ToListAsync();
                // Lấy tất cả câu hỏi
                var questions = await _context.Question
                    .ToListAsync();

                // so sánh đáp án.
                foreach (var item in quiz_Answer)
                {
                    var correctAnswer = correctAnswers?.FirstOrDefault(m => m.QuestionId == item.QuestionId && m.CorrectAnser == true);
                    if (correctAnswer != null && correctAnswer?.AnswerId == item.AnswerId)
                    {
                        answerList.Add(new UserAnswers
                        {
                            QuestionId = item.QuestionId,
                            QuestionText = questions.Where(m => m.QuestionId == item.QuestionId).Select(m => m.Text).FirstOrDefault(),
                            SelectedAnswer = item.AnswerId,
                            QuestionAnswer = correctAnswer.AnswerId,
                            TextAnswer = correctAnswer.Text,
                            Explain = questions.Where(m => m.QuestionId == item.QuestionId).Select(m => m.Explain).FirstOrDefault(),
                            IsCorrect = true
                        });
                        correctCount++;
                    }
                    else
                    {
                        answerList.Add(new UserAnswers
                        {
                            QuestionId = item.QuestionId,
                            QuestionText = questions.Where(m => m.QuestionId == item.QuestionId).Select(m => m.Text).FirstOrDefault(),
                            SelectedAnswer = item.AnswerId,
                            TextUser   = correctAnswers?.Where(m => m.AnswerId == item.AnswerId).Select(m => m.Text).FirstOrDefault() ?? "Không tìm thấy",
                            TextAnswer = correctAnswer?.Text ?? "Không tìm thấy",
                            Explain = questions.Where(m => m.QuestionId == item.QuestionId).Select(m => m.Explain).FirstOrDefault(),
                            IsCorrect = false
                        });
                    }
                }
                // trả ra kết quả
                var response = new SubmitAnswerResponse
                {
                    TotalQuestions = answerList.Count,
                    CorrectCount = correctCount,
                    Details = answerList.OrderBy(m => m.QuestionId).ToList()
                };
                return Ok(response);
            }

            return BadRequest("Không có câu trả lời");
        }

        // GET Questions and Anwers: api/Questions
        [HttpGet("id")]
        public async Task<ActionResult<IEnumerable<Object>>> GetQuestionById(int id)
        {
            var questionsList = await _context.Question
                .Where(q => q.QuestionId == id)
                          .Select(q => new
                          {
                              q.QuestionId,
                              q.Text,
                              q.Explain,
                              Answers = _context.Answer
                              .Where(m => m.QuestionId == id)
                              .Select(m => new
                              {
                                  m.AnswerId,
                                  m.Text,
                                  m.CorrectAnser
                              }).ToList()
                          }).ToListAsync();

            return questionsList;
        }


    }
}
