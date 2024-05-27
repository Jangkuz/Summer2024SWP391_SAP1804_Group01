using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using backend.Data;
using backend.DTOs.Authentication;
using backend.Enums;
using backend.Interfaces;
using backend.Models;
using Microsoft.IdentityModel.Tokens;

namespace backend.Service
{
    public class TokenService : ITokenService
    {
        private readonly IConfiguration _config;
        private readonly SymmetricSecurityKey _key;

        public TokenService(IConfiguration config, ApplicationDbContext context)
        {
            _config = config;
            _key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["JWT:SigningKey"]));
        }

        public string CreateToken(Account account)
        {
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Email, account.Email),
                new Claim(ClaimTypes.Role, account.Role.ToString()),
                new Claim("accountId", account.AccountId.ToString())
            };

            var creds = new SigningCredentials(_key, SecurityAlgorithms.HmacSha512Signature);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddHours(1),
                SigningCredentials = creds,
                Issuer = _config["JWT:Issuer"],
                Audience = _config["JWT:Audience"]
            };

            var tokenHandler = new JwtSecurityTokenHandler();

            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }

        public string CreateVerifyToken(RegisterDTO registerDto)
        {
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Email, registerDto.Email),
                new Claim("name", registerDto.Name),
                new Claim("password", registerDto.Password),
                new Claim("birthday", registerDto.Birthday.ToString()),
                new Claim("phoneNumber", registerDto.PhoneNumber),
                new Claim("address", registerDto.Address),
                new Claim("gender", registerDto.Gender.ToString()),
            };

            var creds = new SigningCredentials(_key, SecurityAlgorithms.HmacSha512Signature);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.Now.AddMinutes(2),
                SigningCredentials = creds,
                Issuer = _config["JWT:Issuer"],
                Audience = _config["JWT:Audience"]
            };

            var tokenHandler = new JwtSecurityTokenHandler();

            var token = tokenHandler.CreateToken(tokenDescriptor);

            return tokenHandler.WriteToken(token);
        }

        public RegisterDTO ParseToken(string verifyGmailToken)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var jwt = tokenHandler.ReadJwtToken(verifyGmailToken);

            string name = jwt.Claims.FirstOrDefault(c => c.Type == "name")?.Value;
            string password = jwt.Claims.FirstOrDefault(c => c.Type == "password")?.Value;
            string phoneNumber = jwt.Claims.FirstOrDefault(c => c.Type == "phoneNumber")?.Value;
            string address = jwt.Claims.FirstOrDefault(c => c.Type == "address")?.Value;
            string email = jwt.Claims.FirstOrDefault(c => c.Type == "email")?.Value;
            DateTime birthday = DateTime.Parse(
                jwt.Claims.FirstOrDefault(c => c.Type == "birthday")?.Value
            );
            Gender gender = Enum.Parse<Gender>(
                jwt.Claims.FirstOrDefault(c => c.Type == "gender")?.Value
            );

            var registerDto = new RegisterDTO();

            registerDto.Name = name;
            registerDto.Password = password;
            registerDto.PhoneNumber = phoneNumber;
            registerDto.Address = address;
            registerDto.Email = email;
            registerDto.Birthday = birthday;
            registerDto.Gender = gender;
            return registerDto;
        }
    }
}
