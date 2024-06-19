using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Feedback;
using backend.Models;

namespace backend.Mappers
{
    public static class FeedbackMapper
    {
        public static FeedbackDTO ToFeedbackDTO(this Feedback Feedback)
        {
            return new FeedbackDTO
            {
                Content = Feedback.Content,
                Score = Feedback.Score,
                Username = Feedback?.Order?.Customer?.Name,
                CreatedAt = Feedback.CreatedAt
            };
        }

        public static Feedback ToFeedbackFromCreate(this CreateFeedbackDTO FeedbackDto)
        {
            return new Feedback { Content = FeedbackDto.Content, Score = FeedbackDto.Score, };
        }
    }
}
