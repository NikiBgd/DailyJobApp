using DailyJobStarterPack.DataBaseObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Requests.Offers
{
    public class OffersRequest : Request
    {
        public int TeamId { get; set; }
        public Role Role { get; set; }
    }

    public class CreateNewOfferRequest : Request
    {
        public Offer Offer { get; set; }
    }

    public class UpdateOfferRequest : Request
    {
        public Offer Offer { get; set; }
    }

    public class DeleteOfferRequest : Request
    {
        public int OfferId { get; set; }
    }
}
