using DailyJobStarterPack.DataBaseObjects;
using DailyJobStarterPack.Web.ViewModels.Security;
using DataBaseCommunication.Mappers;
using DataBaseCommunication.Mappers.Interfaces;
using DataBaseCommunication.Services;
using DataBaseCommunication.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DailyJob.Controllers
{
    public class OfferController : Controller
    {
        private readonly IOfferService _offerService;
        private readonly IOfferMapper _offerMapper;

        public OfferController()
            : this(new OfferService(), new OfferMapper())
        {
        }

        public OfferController(IOfferService offerService, IOfferMapper offerMapper)
        {
            _offerService = offerService;
            _offerMapper = offerMapper;
        }

        public ActionResult Index()
        {
            var request = _offerMapper.GetOffersRequest(SessionData.User.Team.Id, SessionData.User.Role);
            var result = _offerService.GetOffers(request);

            foreach (var offer in result.Offers)
            {
                offer.Services = new List<Service>();
                var selectedServices = offer.ServiceId;
                foreach (var serviceID in selectedServices.Split(','))
                {
                    var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                    offer.Services.Add(s);
                }
            }

            SessionData.Offers = result.Offers;

            return View();
        }


        [HttpGet]
        public ActionResult CreateNewOffer()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateNewOffer(FormCollection form)
        {
            Offer offer = new Offer();
            UpdateModel(offer);
            offer.Services = new List<Service>();
            var selectedServices = form["JobType"];
            foreach (var serviceID in selectedServices.Split(','))
            {
                var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                offer.Services.Add(s);
            }

            var request = _offerMapper.GetCreateNewOfferRequest(offer);
            var result = _offerService.AddNewOffer(request);

            if (result.isSuccesful)
            {
                //update user data
                var requestForUpdate = _offerMapper.GetOffersRequest(SessionData.User.Team.Id, SessionData.User.Role);
                var resultForUpdate = _offerService.GetOffers(requestForUpdate);

                SessionData.Offers = resultForUpdate.Offers;
                ViewData["isSuccessful"] = true;
            }
            
            return View();
        }
    }
}