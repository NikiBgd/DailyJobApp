﻿using DailyJobStarterPack.Controllers;
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
    [AllowAnonymous]
    public class CreationsController : Controller
    {

        private readonly ICreationsService _creationsService;
        private readonly ICreationsMapper _creationsMapper;

        public CreationsController()
            : this(new CreationsService(), new CreationsMapper())
        {
        }

        public CreationsController(ICreationsService creationsService, ICreationsMapper creationsMapper)
        {
            _creationsService = creationsService;
            _creationsMapper = creationsMapper;
        }


        public ActionResult Index()
        {
            var request = _creationsMapper.GetCurrentCreations(SessionData.User.Team.Id, SessionData.User.Role);
            var result = _creationsService.GetCurrentCreations(request);

            foreach (var creation in result.Creations)
            {
                creation.Services = new List<Service>();
                var selectedServices = creation.JobType;
                foreach (var serviceID in selectedServices.Split(','))
                {
                    var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                    creation.Services.Add(s);
                }
            }

            SessionData.Creations = result.Creations;

            return View();
        }


        public ActionResult SendMail(int creationId)
        {
            var creation = SessionData.Creations.FirstOrDefault(x => x.CreationId == creationId);

            var request = _creationsMapper.GetSendMailRequest(creation);
            var result = _creationsService.SendCreationMail(request);

            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && result.IsSucessful)
            {
                var requestForUpdatingList = _creationsMapper.GetCurrentCreations(SessionData.User.Team.Id, SessionData.User.Role);
                var resultOfUpdating = _creationsService.GetCurrentCreations(requestForUpdatingList);

                foreach (var c in resultOfUpdating.Creations)
                {
                    c.Services = new List<Service>();
                    var selectedServices = c.JobType;
                    foreach (var serviceID in selectedServices.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        c.Services.Add(s);
                    }
                }

                SessionData.Creations = resultOfUpdating.Creations;
            }

            return Json(result);
        }

        public ActionResult UpdateAnswerStatus(int creationId)
        {
            var creation = SessionData.Creations.FirstOrDefault(x => x.CreationId == creationId);

            var request = _creationsMapper.GetUpdateAnswerStatusRequest(creation);
            var result = _creationsService.UpdateAnswerStatus(request);

            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && result.IsSucessful)
            {
                var requestForUpdatingList = _creationsMapper.GetCurrentCreations(SessionData.User.Team.Id, SessionData.User.Role);
                var resultOfUpdating = _creationsService.GetCurrentCreations(requestForUpdatingList);

                foreach (var c in resultOfUpdating.Creations)
                {
                    c.Services = new List<Service>();
                    var selectedServices = c.JobType;
                    foreach (var serviceID in selectedServices.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        c.Services.Add(s);
                    }
                }

                SessionData.Creations = resultOfUpdating.Creations;
            }

            return Json(result);
        }



        public ActionResult UpdatePaymentStatus(int creationId)
        {
            var creation = SessionData.Creations.FirstOrDefault(x => x.CreationId == creationId);

            var request = _creationsMapper.GetUpdatePaymentStatusRequest(creation);
            var result = _creationsService.UpdatePaymentStatus(request);

            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && result.IsSucessful)
            {
                var requestForUpdatingList = _creationsMapper.GetCurrentCreations(SessionData.User.Team.Id, SessionData.User.Role);
                var resultOfUpdating = _creationsService.GetCurrentCreations(requestForUpdatingList);

                foreach (var c in resultOfUpdating.Creations)
                {
                    c.Services = new List<Service>();
                    var selectedServices = c.JobType;
                    foreach (var serviceID in selectedServices.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        c.Services.Add(s);
                    }
                }

                SessionData.Creations = resultOfUpdating.Creations;
            }

            return Json(result);
        }

        public ActionResult UpdateDoneStatus(int creationId)
        {
            var creation = SessionData.Creations.FirstOrDefault(x => x.CreationId == creationId);

            var request = _creationsMapper.GetUpdateDoneStatusRequest(creation);
            var result = _creationsService.UpdateDoneStatus(request);

            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && result.IsSucessful)
            {
                var requestForUpdatingList = _creationsMapper.GetCurrentCreations(SessionData.User.Team.Id, SessionData.User.Role);
                var resultOfUpdating = _creationsService.GetCurrentCreations(requestForUpdatingList);

                foreach (var c in resultOfUpdating.Creations)
                {
                    c.Services = new List<Service>();
                    var selectedServices = c.JobType;
                    foreach (var serviceID in selectedServices.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        c.Services.Add(s);
                    }
                }

                SessionData.Creations = resultOfUpdating.Creations;
            }

            return Json(result);
        }


        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(FormCollection form)
        {
            Creation creation = new Creation();
            UpdateModel(creation);
            creation.Services = new List<Service>();
            creation.Services = new List<Service>();
            var selectedServices = form["JobType"];
            foreach (var serviceID in selectedServices.Split(','))
            {
                var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                creation.Services.Add(s);
            }

            var request = _creationsMapper.GetAddCreationRequest(creation);
            var result = _creationsService.AddCreation(request);

            if (result.IsSucessful)
            {
                //update user data
                var requestForUpdatingList = _creationsMapper.GetCurrentCreations(SessionData.User.Team.Id, SessionData.User.Role);
                var resultOfUpdating = _creationsService.GetCurrentCreations(requestForUpdatingList);

                foreach (var c in resultOfUpdating.Creations)
                {
                    c.Services = new List<Service>();
                    var selectedServicesUpdate = c.JobType;
                    foreach (var serviceID in selectedServicesUpdate.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        c.Services.Add(s);
                    }
                }

                SessionData.Creations = resultOfUpdating.Creations;
                ViewData["isSuccessful"] = true;
            }

            return View();
        }


        [HttpGet]
        public ActionResult UpdateCreation(int CreationId)
        {
            var creation = SessionData.Creations.FirstOrDefault(x => x.CreationId == CreationId);
            return View(creation);
        }

        [HttpPost]
        public ActionResult UpdateCreation(FormCollection form)
        {
            Creation creation = new Creation();
            UpdateModel(creation);
            creation.Services = new List<Service>();
            var selectedServices = form["JobType"];
            foreach (var serviceID in selectedServices.Split(','))
            {
                var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                creation.Services.Add(s);
            }

            var request = _creationsMapper.GetUpdateCreationRequest(creation);
            var result = _creationsService.UpdateCreation(request);

            if (result.IsSucessful)
            {
                //update user data
                var requestForUpdatingList = _creationsMapper.GetCurrentCreations(SessionData.User.Team.Id, SessionData.User.Role);
                var resultOfUpdating = _creationsService.GetCurrentCreations(requestForUpdatingList);

                foreach (var c in resultOfUpdating.Creations)
                {
                    c.Services = new List<Service>();
                    var selectedServicesUpdate = c.JobType;
                    foreach (var serviceID in selectedServicesUpdate.Split(','))
                    {
                        var s = SessionData.Services.FirstOrDefault(x => x.ServiceId == Int32.Parse(serviceID));
                        c.Services.Add(s);
                    }
                }

                SessionData.Creations = resultOfUpdating.Creations;
                ViewData["isSuccessful"] = true;
            }

            return View(creation);
        }

        public ActionResult PrintDocuments(int creationId)
        {
            var client = SessionData.Creations.FirstOrDefault(x => x.CreationId == creationId);

            var file = ReportHelper.GeneratePdfReport(client, "creations");
            return File(file, "application/pdf", client.Name +".pdf");
        }
    }
}