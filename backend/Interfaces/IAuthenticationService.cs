using backend.DTOs.Authentication;

namespace backend.Interfaces
{
    public interface IAuthenticationService
    {
        Task<AuthenticationResponse?> Login(LoginDTO loginDto);
        Task<AuthenticationResponse?> Register(RegisterDTO registerDto);

        Task<AuthenticationResponse?> VerifyGmail(string token);
        //Task<RegisterDTO?> VerifyGmail(string token);
    }
}
