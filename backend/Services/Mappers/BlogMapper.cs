using System.Text.RegularExpressions;
using backend.BusinessOjects.Models;
using backend.Services.DTOs.Blog;
using backend.Services.Helper;

namespace backend.Services.Mappers
{
    public static class BlogMapper
    {
        public static BlogDTO ToBlogDTO(this Blog blog)
        {
            string cleanedContent = Regex
                .Replace(blog.Content, "<.*?>", string.Empty)
                .Replace("&nbsp;", " ")
                .Replace("&amp;", "&");

            return new BlogDTO
            {
                AuthorName = blog.Author.Name,
                BlogId = blog.BlogId,
                CreatedAt = blog.CreatedAt,
                Content =
                    cleanedContent.Length > 200 ? cleanedContent.Substring(0, 180) : cleanedContent,
                ThumbnailUrl = HtmlParser.ExtractFirstImageFromHtml(blog.Content),
                Title = blog.Title,
                IsHidden = blog.IsHidden
            };
        }

        public static Blog ToBlogFromCreate(this CreateBlogDTO blogDto)
        {
            return new Blog() { Content = blogDto.Content, Title = blogDto.Title };
        }
    }
}
