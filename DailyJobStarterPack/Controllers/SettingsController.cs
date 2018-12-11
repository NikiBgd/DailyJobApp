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
    public class SettingsController : Controller
    {

        private readonly ISettingsService _settingsService;
        private readonly ISettingsMapper _settingsMapper;

        public SettingsController()
            : this(new SettingsService(), new SettingsMapper())
        {
        }

        public SettingsController(ISettingsService settingsService, ISettingsMapper settingsMapper)
        {
            _settingsService = settingsService;
            _settingsMapper = settingsMapper;
        }

        // GET: Settings
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Setting setting)
        {
            var request = _settingsMapper.ChangeSetting(setting);
            var response = _settingsService.ChangeAdminSetting(request);

            if(response.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && response.isSuccessful)
            {
                var requestForSettings = _settingsMapper.GetSettings();
                var resultForSettings = _settingsService.GetAdminSettings(requestForSettings);
                SessionData.Settings = resultForSettings.Settings;
            }

            return View();
        }

        [HttpGet]
        public ActionResult Services()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Firms()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Times()
        {
            return View();
        }

        [HttpGet]
        public ActionResult CreateNewTime()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Warnings()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateNewTime(Time time)
        {
            var request = _settingsMapper.GetCreateTimeRequest(time);
            var response = _settingsService.AddTimeSetting(request);

            if (response.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && response.isSuccessful)
            {
                var requestForTimes = _settingsMapper.GetTimesRequest();
                var resultForTimes = _settingsService.GetAdminTimes(requestForTimes);

                SessionData.Times = resultForTimes.Times;
                ViewData["isSuccessful"] = true;
            }

            return View();
        }

        [HttpPost]
        public ActionResult Times(Time time)
        {
            var request = _settingsMapper.GetUpdateTimeRequest(time);
            var response = _settingsService.UpdateTimeSetting(request);

            if (response.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && response.isSuccessful)
            {
                var requestForTimes = _settingsMapper.GetTimesRequest();
                var resultForTimes = _settingsService.GetAdminTimes(requestForTimes);

                SessionData.Times = resultForTimes.Times;
                ViewData["isSuccessful"] = true;
            }

            return View();
        }

        [HttpGet]
        public ActionResult CreateNewFirm()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateNewFirm(Firm firm)
        {
            var request = _settingsMapper.GetCreateFirmRequest(firm);
            var response = _settingsService.AddFirmSetting(request);

            if (response.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && response.isSuccessful)
            {
                var requestForFirms = _settingsMapper.GetFirmsRequest();
                var resultForFirms = _settingsService.GetAdminFirms(requestForFirms);

                SessionData.Firms = resultForFirms.Firms;
                ViewData["isSuccessful"] = true;
            }

            return View();
        }

        [HttpGet]
        public ActionResult CreateNewService()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateNewService(Service service)
        {
            var request = _settingsMapper.GetCreateServiceRequest(service);
            var response = _settingsService.AddServiceSetting(request);

            if (response.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && response.isSuccessful)
            {
                var requestForServices = _settingsMapper.GetServicesRequest();
                var resultForServices = _settingsService.GetAdminServices(requestForServices);

                SessionData.Services = resultForServices.Services;
                ViewData["isSuccessful"] = true;
            }
            
            return View();
        }

        [HttpPost]
        public ActionResult Services(Service service)
        {
            var request = _settingsMapper.GetUpdateServiceRequest(service);
            var response = _settingsService.UpdateServiceSetting(request);

            if (response.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && response.isSuccessful)
            {
                var requestForServices = _settingsMapper.GetServicesRequest();
                var resultForServices = _settingsService.GetAdminServices(requestForServices);

                SessionData.Services = resultForServices.Services;
                ViewData["isSuccessful"] = true;
            }

            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        public ActionResult DeleteFirm(int firmId)
        {
            var request = _settingsMapper.GetDeleteFirmRequest(firmId);
            var result = _settingsService.DeleteFirm(request);

            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && result.isSuccessful)
            {
                var requestForFirms = _settingsMapper.GetFirmsRequest();
                var resultForFirms = _settingsService.GetAdminFirms(requestForFirms);

                SessionData.Firms = resultForFirms.Firms;
                ViewData["isSuccessful"] = true;
            }

            return Json(result);
        }

        [AllowAnonymous]
        public ActionResult DeleteService(int serviceId)
        {
            var request = _settingsMapper.GetDeleteServiceRequest(serviceId);
            var result = _settingsService.DeleteService(request);

            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success && result.isSuccessful)
            {
                var requestForService = _settingsMapper.GetServicesRequest();
                var resultForServices = _settingsService.GetAdminServices(requestForService);

                SessionData.Services = resultForServices.Services;
                ViewData["isSuccessful"] = true;
            }

            return Json(result);
        }
    }
}