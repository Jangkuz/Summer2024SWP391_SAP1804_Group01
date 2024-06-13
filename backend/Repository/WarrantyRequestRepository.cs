using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using backend.DTOs.Order;
using backend.DTOs.WarrantyRequest;
using backend.Enums;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Repository
{
    public class WarrantyRequestRepository : IWarrantyRequestRepository
    {
        private readonly ApplicationDbContext _context;

        public WarrantyRequestRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<WarrantyRequest?> CreateWarrantyRequestAsync(
            long customerId,
            CreateWarrantyRequestDTO warrantyRequestDto
        )
        {
            var customer = await _context.Accounts.FindAsync(customerId);
            if (customer == null)
            {
                return null;
            }
            var warrantyRequest = warrantyRequestDto.ToWarrantyRequestFromCreate();
            var warrantyCard = await _context.WarrantyCards.FindAsync(
                warrantyRequestDto.WarrantyCardId
            );
            if (warrantyCard == null)
            {
                return null;
            }
            warrantyRequest.Customer = customer;
            warrantyRequest.WarrantyCard = warrantyCard;

            await _context.WarrantyRequests.AddAsync(warrantyRequest);
            await _context.SaveChangesAsync();
            return warrantyRequest;
        }

        public Task<WarrantyRequest?> DeleteWarrantyRequestAsync(long id)
        {
            throw new NotImplementedException();
        }

        public async Task<WarrantyRequestResult> GetAllWarrantyRequestsAsync(WarrantyRequestQuery query)
        {
            var warrantyRequestQueries = _context
                .WarrantyRequests.Include(x => x.WarrantyCard)
                .ThenInclude(x => x.OrderDetail)
                .ThenInclude(x => x.Diamond)
                .ThenInclude(x => x.Shape)
                .Include(x => x.WarrantyCard)
                .ThenInclude(x => x.OrderDetail)
                .ThenInclude(x => x.Accessory)
                .Include(x => x.SaleStaff)
                .Include(x => x.DeliveryStaff)
                .Include(x => x.Customer)
                .AsQueryable();
            if (query.WarrantyStatus != null)
            {
                warrantyRequestQueries = warrantyRequestQueries.Where(x => x.WarrantyStatus == query.WarrantyStatus);
            }

            var totalCount = await warrantyRequestQueries.CountAsync();

            var totalPages = (int)Math.Ceiling((double)totalCount / query.PageSize);
            var orderDTOs = await warrantyRequestQueries
                .Skip((query.PageNumber - 1) * query.PageSize)
                .Take(query.PageSize)
                .Select(x => x.ToWarrantyRequestDTO())
                .ToListAsync();

            return new WarrantyRequestResult
            {
                WarrantyRequests = orderDTOs,
                TotalCount = totalCount,
                PageSize = query.PageSize,
                CurrentPage = query.PageNumber,
                TotalPages = totalPages
            };
        }

        public async Task<WarrantyRequest?> GetWarrantyRequestByIdAsync(long id)
        {
            return await _context.WarrantyRequests.FindAsync(id);
        }

        public async Task<WarrantyRequest?> UpdateWarrantyRequestAsync(
            long id,
            UpdateWarrantyRequestDTO warrantyRequestDto
        )
        {
            var existedWarrantyRequest = await _context.WarrantyRequests.FirstOrDefaultAsync(x => x.WarrantyRequestId.Equals(id));
            if (existedWarrantyRequest == null)
            {
                return null;
            }
            if (warrantyRequestDto.WarrantyStatus != null) {
                existedWarrantyRequest.WarrantyStatus = Enum.Parse<WarrantyStatus>(warrantyRequestDto.WarrantyStatus);
            }
            if (warrantyRequestDto.SaleStaffId != 0)
            {
                var saleStaff = _context.Accounts.FirstOrDefault(x => x.AccountId == warrantyRequestDto.SaleStaffId);
                existedWarrantyRequest.SaleStaff = saleStaff;
            }
            if (warrantyRequestDto.DeliveryStaffId != 0)
            {
                var deliveryStaff = _context.Accounts.FirstOrDefault(x => x.AccountId == warrantyRequestDto.DeliveryStaffId);
                existedWarrantyRequest.DeliveryStaff = deliveryStaff;
            }
            if (warrantyRequestDto.ReturnTime != null)
            {
                existedWarrantyRequest.ReturnTime = warrantyRequestDto.ReturnTime;
            }
            _context.Entry(existedWarrantyRequest).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return existedWarrantyRequest;
        }
    }
}
