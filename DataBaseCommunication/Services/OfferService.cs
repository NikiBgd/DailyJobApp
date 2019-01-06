using DataBaseCommunication.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataBaseCommunication.Mappers.Requests.Offers;
using DataBaseCommunication.Mappers.Response.Offers;
using DataBaseCommunication.Mappers.Response;
using DataBaseCommunication.Mappers.Requests;
using DataBaseCommunication.DataProviders;

namespace DataBaseCommunication.Services
{
    public class OfferService : IOfferService
    {
        public CreateNewOfferResponse AddNewOffer(CreateNewOfferRequest request)
        {
            var response = new CreateNewOfferResponse { ResponseStatus = ResponseStatus.Success };

            var offersProvider = new OffersProvider();
            try
            {
                if (request.ActionType == ActionType.Insert)
                {
                    response.isSuccesful = offersProvider.AddNewOffer(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public DeleteOfferResponse DeleteOffer(DeleteOfferRequest request)
        {
            var response = new DeleteOfferResponse { ResponseStatus = ResponseStatus.Success };

            var offersProvider = new OffersProvider();
            try
            {
                if (request.ActionType == ActionType.Delete)
                {
                    response.IsSucessful = offersProvider.DeleteOffer(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public OffersResponse GetOffers(OffersRequest request)
        {
            var response = new OffersResponse { ResponseStatus = ResponseStatus.Success };

            var offersProvider = new OffersProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.Offers = offersProvider.GetOffers(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }


        public UpdateOfferResponse UpdateOffer(UpdateOfferRequest request)
        {
            var response = new UpdateOfferResponse { ResponseStatus = ResponseStatus.Success };

            var offersProvider = new OffersProvider();
            try
            {
                if (request.ActionType == ActionType.Update)
                {
                    response.IsSucessful = offersProvider.UpdateOffer(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

    }
}
