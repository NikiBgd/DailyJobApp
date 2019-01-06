using DataBaseCommunication.Mappers.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DailyJobStarterPack.DataBaseObjects;
using DataBaseCommunication.Mappers.Requests.Offers;

namespace DataBaseCommunication.Mappers
{
    public class OfferMapper : IOfferMapper
    {
        public CreateNewOfferRequest GetCreateNewOfferRequest(Offer offer)
        {
            var request = new CreateNewOfferRequest
            {
                Offer = offer,
                ActionType = Requests.ActionType.Insert
            };

            return request;
        }

        public DeleteOfferRequest GetDeleteOfferRequest(int offerId)
        {
            var request = new DeleteOfferRequest
            {
                OfferId = offerId,
                ActionType = Requests.ActionType.Delete
            };

            return request;
        }

        public OffersRequest GetOffersRequest(int id, Role role)
        {
            var request = new OffersRequest
            {
                Role = role,
                TeamId = id,
                ActionType = Requests.ActionType.Select
            };

            return request;
        }

        public UpdateOfferRequest GetUpdateOfferRequest(Offer offer)
        {
            var request = new UpdateOfferRequest
            {
                Offer = offer,
                ActionType = Requests.ActionType.Update
            };

            return request;
        }

    }
}
