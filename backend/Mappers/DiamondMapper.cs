using backend.DTOs;
using backend.Models;

namespace backend.Mappers
{
    public static class DiamondMapper
    {
        public static DiamondDTO ToDiamondDTO(this Diamond diamond)
        {
            return new DiamondDTO
            {
                DiamondId = diamond.DiamondId,
                Lab = diamond.Lab,
                CertificateNumber = diamond.CertificateNumber,
                CertificateUrl = diamond.Lab,
                ImageUrl = diamond.ImageUrl,
                Carat = diamond.Carat,
                Cut = diamond.Cut,
                Clarity = diamond.Clarity.ToString(),
                Color = diamond.Color.ToString(),
                Polish = diamond.Polish,
                Symmetry = diamond.Symmetry,
                Fluorescence = diamond.Fluorescence,
                Availability = diamond.Availability,
                Shape = diamond.Shape.ToShapeDTO(),
            };
        }
    }
}
