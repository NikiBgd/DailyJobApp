using DailyJobStarterPack.DataBaseObjects;
using DailyJobStarterPack.DataBaseObjects.Mappers;
using DailyJobStarterPack.DataBaseObjects.Mappers.Interfaces;
using DailyJobStarterPack.Web.ViewModels.Security;
using DataBaseCommunication.Helpers;
using DataBaseCommunication.Mappers.Response.Clients;
using DataBaseCommunication.Services;
using DataBaseCommunication.Services.Clients;
using DataBaseCommunication.Services.Interface;
using System.Linq;
using System.Web.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using iTextSharp.text.pdf;
using iTextSharp.text;
using DailyJobStarterPack.Web.Services;

namespace DailyJobStarterPack.Controllers
{
    [AllowAnonymous]
    public class ClientsController : Controller
    {
        private readonly IClientsService _clientsService;
        private readonly IClientsMapper _clientsMapper;

        public ClientsController()
            : this(new ClientsService(), new ClientsMapper())
        {
        }

        public ClientsController(IClientsService clientService, IClientsMapper clientsMapper)
        {
            _clientsService = clientService;
            _clientsMapper = clientsMapper;
        }

        [HttpGet]
        public ActionResult Index()
        {
            var response = new AllClientsResponse()
            {
                Clients = SessionData.Clients
            };
            return View(response);
        }

        [HttpPost]
        public ActionResult Index(ClientsSearchCriteria criteria)
        {
            var filteredClients = ClientsHelper.ApplyClientsSearchCriteria(criteria, SessionData.Clients);

            if (!string.IsNullOrEmpty(criteria.ReportType))
            {
                byte[] file = null;
                switch (criteria.ReportType)
                {
                    case "PDF":
                        file = ReportHelper.GeneratePdfReport(filteredClients, "clients");
                        return File(file, "application/pdf", "fileName.pdf");
                    case "EXCELL":
                        file = ReportHelper.GenerateExcellReport(filteredClients, "clients");
                        return File(file, "application/vnd.ms-excel", "fileName.xlsx");
                }
            }

            var response = new AllClientsResponse()
            {
                Clients = filteredClients,
                ClientsSearchCriteria = criteria
            };
            return View(response);
        }

        [HttpGet]
        public ActionResult Details(int clientId)
        {
            var request = _clientsMapper.GetClientChangesRequest(clientId);
            var result = _clientsService.GetClientChanges(request);

            ViewData["LastChanges"] = result.Changes.Where(x => x.FieldName == "BrojZapolsenih").OrderByDescending(x => x.ChangeDate).Take(2).ToList();

            var client = SessionData.Clients.FirstOrDefault(x => x.CustomerID == clientId);
            return View(client);
        }

        [HttpGet]
        public ActionResult AllTimes(int clientId)
        {
            DateTime now = DateTime.Now;
            var startDate = new DateTime(now.Year, now.Month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);

            var request = _clientsMapper.GetAllTimesForClientRequest(clientId, startDate, endDate);
            var result = _clientsService.GetAllTimesForClient(request);

            return View(result);
        }

        [HttpPost]
        public ActionResult AllTimes(int clientId, DateTime dateFrom, DateTime dateTo)
        {
            var request = _clientsMapper.GetAllTimesForClientRequest(clientId, dateFrom, dateTo);
            var result = _clientsService.GetAllTimesForClient(request);

            return View(result);
        }

        [HttpGet]
        public ActionResult AllWorkerOrders(int clientId)
        {
            DateTime now = DateTime.Now;
            var startDate = new DateTime(now.Year, now.Month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);

            var request = _clientsMapper.GetAllWorkerOrdersForClientRequest(clientId, startDate, endDate);
            var result = _clientsService.GetAllWorkerOrdersForClient(request);

            return View(result);
        }

        [HttpPost]
        public ActionResult AllWorkerOrders(int clientId, DateTime dateFrom, DateTime dateTo)
        {
            var request = _clientsMapper.GetAllWorkerOrdersForClientRequest(clientId, dateFrom, dateTo);
            var result = _clientsService.GetAllWorkerOrdersForClient(request);

            return View(result);
        }

        public ActionResult DeleteClient(int clientId)
        {
            var request = _clientsMapper.GetUpdateClientStatusRequest(clientId, 0, SessionData.User.Role, SessionData.User.Team.Id);
            var result = _clientsService.UpdateClientStatus(request);

            if(result.isSuccessful)
            {
                SessionData.Clients = result.NewClientsList;
            }

            return Json(result);
        }

        public ActionResult ActivateClient(int clientId)
        {
            var request = _clientsMapper.GetUpdateClientStatusRequest(clientId, 1, SessionData.User.Role, SessionData.User.Team.Id);
            var result = _clientsService.UpdateClientStatus(request);

            if (result.isSuccessful)
            {
                SessionData.Clients = result.NewClientsList;
            }

            return Json(result);
        }

        public ActionResult Statistics()
        {
            return View(SessionData.Clients);
        }

        [HttpGet]
        public ActionResult ChangeData(int clientId)
        {
            var client = SessionData.Clients.FirstOrDefault(x => x.CustomerID == clientId);
            return View(client);
        }

        [HttpPost]
        public ActionResult ChangeData(ClientProfile client)
        {
            var oldClientProfile = SessionData.Clients.FirstOrDefault(x => x.CustomerID == client.CustomerID);
            var request = _clientsMapper.GetUpdateUserDateRequest(client, SessionData.User.Role, SessionData.User.Team.Id, SessionData.User.Id, oldClientProfile);
            var result = _clientsService.UpdateClientData(request);
            if (result.isSuccessful)
            {
                var nbsService = new NBSService();
                //exchange if needed
                foreach (var sessionClient in result.NewClientsList)
                {
                    if (sessionClient.AmountCode.ToLower() == "rsd")
                    {
                        sessionClient.LocalAmount = sessionClient.Amount;
                    }
                    else
                    {
                        var localAmount = nbsService.ChangeToRsd(sessionClient.AmountCode, "rsd", sessionClient.Amount, "sre");
                        sessionClient.LocalAmount = Decimal.Parse(localAmount.Result.Value);
                    }
                }

                //update user data
                SessionData.Clients = result.NewClientsList;
                ViewData["isSuccessful"] = true;
            }

            var returningValue = SessionData.Clients.FirstOrDefault(x => x.CustomerID == client.CustomerID);
            return View(returningValue);
        }

        [HttpGet]
        public ActionResult GetLastChanges(int clientId)
        {
            var request = _clientsMapper.GetClientChangesRequest(clientId);
            var result = _clientsService.GetClientChanges(request);

            return PartialView("_changesList", result.Changes);
        }

        [HttpGet]
        public ActionResult GetReports(int clientId)
        {
            var request = _clientsMapper.GetReportsRequest(clientId);
            var result = _clientsService.GetReports(request);

            return PartialView("_reportsList", result.Reports);
        }

        [HttpPost]
        public ActionResult LogTime(int clientId, decimal time)
        {
            var timeInHours = Math.Round(time / 60, 2);
            var request = _clientsMapper.GetLogTimeRequest(clientId, timeInHours, SessionData.User.Id, SessionData.User.Role, SessionData.User.Team.Id);
            var result = _clientsService.LogTime(request);
            if (result.isSuccessful)
            {
                SessionData.Clients = result.NewClientsList;
            }
            return Json(result);
        }

        [HttpPost]
        public ActionResult PrintDocuments(int clientId, string reportType, string documents)
        {
            var client = SessionData.Clients.FirstOrDefault(x => x.CustomerID == clientId);
            if (!string.IsNullOrEmpty(reportType))
            {
                byte[] file = null;
                switch (reportType)
                {
                    case "PDF":
                            file = ReportHelper.GeneratePdfReport(client, documents);
                            return File(file, "application/pdf", "fileName.pdf");
                    case "EXCELL":
                        file = ReportHelper.GenerateExcellReport(client, documents);
                        return File(file, "application/vnd.ms-excel", "fileName.xlsx");
                    case "WORD":
                        file = ReportHelper.GenerateWordReport(client, documents);
                        return File(file, "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "test.docx");
                }
            }

            return null;
        }

        public ActionResult ChageReports(List<Report> Reports, int clientId)
        {

            return RedirectToAction("Details", new { clientId = clientId });
        }

        [HttpPost]
        public ActionResult PrintWorkersOrder(WorkersOrder order, int clientId, int courierId)
        {
            var client = SessionData.Clients.FirstOrDefault(x => x.CustomerID == clientId);
            var courier = SessionData.Courires.FirstOrDefault(x => x.CourierId == courierId);

            order.Client = client;
            order.Courier = courier;

            var request = _clientsMapper.GetWorkersOrderRequest(clientId, courierId, SessionData.User.Id, SessionData.User.Role, SessionData.User.Team.Id);
            var result = _clientsService.LogWorkerOrder(request);
            if(result.isSuccessful)
            {
                SessionData.Clients = result.NewClientsList;
            }

            var file = ReportHelper.GeneratePdfReport(order, "WRK_RPR");
            return File(file, "application/pdf", "fileName.pdf");
        }

        [HttpGet]
        public ActionResult AddNewClient()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddNewClient(ClientProfile client)
        {
            var request = _clientsMapper.GetNewClientRequest(client, SessionData.User.Role, SessionData.User.Team.Id);
            var result = _clientsService.AddNewClient(request);
            if (result.isSuccessful)
            {
                var nbsService = new NBSService();
                //exchange if needed
                foreach (var sessionClient in result.NewClientsList)
                {
                    if (sessionClient.AmountCode.ToLower() == "rsd")
                    {
                        sessionClient.LocalAmount = sessionClient.Amount;
                    }
                    else
                    {
                        var localAmount = nbsService.ChangeToRsd(sessionClient.AmountCode, "rsd", sessionClient.Amount, "sre");
                        sessionClient.LocalAmount = Decimal.Parse(localAmount.Result.Value);
                    }
                }

                //update user data
                SessionData.Clients = result.NewClientsList;
                ViewData["isSuccessful"] = true;
            }

            return View();
        }

        [HttpGet]
        public ActionResult ClientServices(int clientId)
        {
            var request = _clientsMapper.GetClientServicesRequest(clientId);
            var result = _clientsService.GetClientServices(request);
            
            return View(result);
        }

        [HttpPost]
        public ActionResult ClientServices(FormCollection form)
        {
            int clientId = Int32.Parse(form["ClientId"]);
            var services = new List<int>();
            var selectedServices = form["Service"];

            foreach (var serviceID in selectedServices.Split(','))
            {
                var s = Int32.Parse(serviceID);
                services.Add(s);
            }

            var request = _clientsMapper.UpdateClientServicesRequest(clientId, services);
            var result = _clientsService.UpdateClientServices(request);

            if(result.isSuccessful)
            {
                ViewData["isSuccessful"] = true;
            }

            ClientServicesResponse response = new ClientServicesResponse
            {
                ClientId = clientId,
                Services = new List<Service>()
            };

            return View();
        }
    }
}