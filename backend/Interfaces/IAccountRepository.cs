using backend.DTOs.Account;
using backend.Helper;
using backend.Models;

namespace backend.Interfaces
{
    public interface IAccountRepository
    {
        Task<IEnumerable<Account>> GetAllAccountsAsync(AccountQuery query);
        Task<Account?> GetAccountByIdAsync(long id);
        Task<Account?> GetAccountByEmailAsync(string email);
        Task<Account> CreateAccountAsync(Account account);
        Task<Account?> UpdateAccountAsync(long id, UpdateAccountDTO account);
        // Task<Account?> DeleteAccountAsync(long id);
    }
}
