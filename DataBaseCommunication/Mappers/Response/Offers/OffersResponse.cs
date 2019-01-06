using DailyJobStarterPack.DataBaseObjects;
using DataBaseCommunication.Services.Offer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Response.Offers
{
    public class CurrentOffersResponse : Response
    {
        public List<Offer> Offers { get; set; }
        public OffersSearchCriteria OffersSearchCriteria { get; set; }
    }

    public class OffersResponse : Response
    {
        public List<Offer> Offers { get; set; }
    }

    public class CreateNewOfferResponse : Response
    {
        public bool isSuccesful { get; set; }
    }

    public class UpdateOfferResponse : Response
    {
        public bool IsSucessful { get; set; }
    }

    public class DeleteOfferResponse : Response
    {
        public bool IsSucessful { get; set; }
    }
}
