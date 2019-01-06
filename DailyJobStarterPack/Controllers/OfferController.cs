using DailyJobStarterPack.DataBaseObjects;
using DailyJobStarterPack.Web.ViewModels.Security;
using DataBaseCommunication.Helpers;
using DataBaseCommunication.Mappers;
using DataBaseCommunication.Mappers.Interfaces;
using DataBaseCommunication.Mappers.Response.Offers;
using DataBaseCommunication.Services;
using DataBaseCommunication.Services.Interface;
using DataBaseCommunication.Services.Offer;
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

        public ActionResult Index(OffersSearchCriteria criteria)
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

            var filteredOffers = OffersHelper.ApplyOffersSearchCriteria(criteria, SessionData.Offers);

            var response = new CurrentOffersResponse()
            {
                Offers = filteredOffers,
                OffersSearchCriteria = criteria
            };

            return View(response);
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

        [HttpGet]
        public ActionResult UpdateOffer(int offerId)
        {
            var offer = SessionData.Offers.FirstOrDefault(x => x.OfferId == offerId);
            return View(offer);
        }


        [HttpPost]
        public ActionResult UpdateOffer(FormCollection form)
        {
            Offer offer = new Offer();
            UpdateModel(offer);

            var selectedServices = form["JobType"];

            offer.Services = new List<Service>();
            foreach (var serviceID in selectedServices.Split(','))
            {
                var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                offer.Services.Add(s);
            }

            var request = _offerMapper.GetUpdateOfferRequest(offer);
            var result = _offerService.UpdateOffer(request);

            if (result.IsSucessful)
            {
                //update user data
                var requestForUpdating = _offerMapper.GetOffersRequest(SessionData.User.Team.Id, SessionData.User.Role);
                var resultForUpdating = _offerService.GetOffers(requestForUpdating);

                foreach (var updatedOffer in resultForUpdating.Offers)
                {
                    updatedOffer.Services = new List<Service>();
                    var selectedupdatedOfferServices = updatedOffer.ServiceId;
                    foreach (var serviceID in selectedupdatedOfferServices.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        updatedOffer.Services.Add(s);
                    }
                }

                SessionData.Offers = resultForUpdating.Offers;
                ViewData["isSuccessful"] = true;
            }

            return View(offer);
        }


        [HttpPost]
        public ActionResult DeleteOffer(int offerId)
        {
            var request = _offerMapper.GetDeleteOfferRequest(offerId);
            var result = _offerService.DeleteOffer(request);

            if (result.IsSucessful)
            {
                //update user data
                var requestForUpdating = _offerMapper.GetOffersRequest(SessionData.User.Team.Id, SessionData.User.Role);
                var resultForUpdating = _offerService.GetOffers(requestForUpdating);

                foreach (var updatedOffer in resultForUpdating.Offers)
                {
                    updatedOffer.Services = new List<Service>();
                    var selectedupdatedOfferServices = updatedOffer.ServiceId;
                    foreach (var serviceID in selectedupdatedOfferServices.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        updatedOffer.Services.Add(s);
                    }
                }

                SessionData.Offers = resultForUpdating.Offers;
                ViewData["isSuccessful"] = true;
            }


            return Json(result);
        }
    }
}