using DailyJob.Models;
using DailyJobStarterPack.DataBaseObjects;
using DailyJobStarterPack.DataBaseObjects.Mappers;
using DailyJobStarterPack.DataBaseObjects.Mappers.Interfaces;
using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.Mappers;
using DataBaseCommunication.Mappers.Interfaces;
using DataBaseCommunication.Services;
using DataBaseCommunication.Services.Interface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace DailyJob.Controllers
{
    public class BillingController : Controller
    {
        private readonly IBillingsService _billingsService;
        private readonly IBillingsMapper _billingsMapper;
        private readonly IClientsService _clientsService;
        private readonly IClientsMapper _clientsMapper;
        private readonly ISettingsService _settingsService;
        private readonly ISettingsMapper _settingsMapper;

        public BillingController()
            : this(new BillingsService(), new BillingsMapper(),new ClientsService(), new ClientsMapper(),new SettingsService(),new SettingsMapper())
        {
        }

        public BillingController(IBillingsService billingService, IBillingsMapper billingsMapper, IClientsService clientsService,IClientsMapper clientsMapper,ISettingsService settingsService,ISettingsMapper settingsMapper)
        {
            _billingsService = billingService;
            _billingsMapper = billingsMapper;
            _clientsService = clientsService;
            _clientsMapper = clientsMapper;
            _settingsService = settingsService;
            _settingsMapper = settingsMapper;
        }

        [HttpPost]
        public ActionResult UpdateClientBillings(UpdateClientsBillingsInputModel inputModel)
        {
            if (inputModel.ActionType <= 0)
            {
                HttpContext.Response.StatusCode = 400;
                return Json(new { message = "Bad request, ActionType is required!" });
            }

            if (inputModel.ClientIds == null || inputModel.ClientIds.Count == 0)
            {
                HttpContext.Response.StatusCode = 400;
                return Json(new { message = "Bad request, ClientIds are required!" });
            }

            if (inputModel.Months == null || inputModel.Months.Count == 0)
            {
                HttpContext.Response.StatusCode = 400;
                return Json(new { message = "Bad request, Months are required!" });
            }

            if (inputModel.Year == 0)
            {
                HttpContext.Response.StatusCode = 400;
                return Json(new { message = "Bad request, Year is required!" });
            }

            var listOfBillings = new List<Billing>();

            foreach(var client in inputModel.ClientIds)
            {
                foreach (var month in inputModel.Months)
                {
                    var billing = new Billing { Month = month, Year = inputModel.Year, ClientId = client };
                    listOfBillings.Add(billing);
                }
            }

            var updateRequest = _billingsMapper.UpdateBillings(listOfBillings,inputModel.ActionType);
            var response = _billingsService.UpdateBillings(updateRequest);

            if (inputModel.ActionType == 4 || inputModel.ActionType == 3)
            {
                HandleClientsWarnings(listOfBillings, inputModel.ActionType);
            }

            if (!response)
            {
                HttpContext.Response.StatusCode = 500;
                return Json(new { message = "Error occured on server!" });
            }

            return Json(new { message = "Update successful" });

        }

        // GET: Billing
        public ActionResult GetBillings(int year)
        {
            var request = _billingsMapper.GetBillingsRequest(year);
            var result = _billingsService.GetBillings(request);

            return View();
        }

        // POST: InsertBilling
        [HttpGet]
        public ActionResult UpdateBillings(List<Billing> billingss)
        {
            var listForUpdate = new List<Billing>();
            var billings = _billingsMapper.GetBillingsRequest(2018);

            //uraditi razliku GET  iz baze i onoga sto je stiglo ajaxom.
            //Razlika se upisuje insertom, a presek update-om

            Billing a = new Billing { ClientId = 4, Year = 2018,Month = 2,Paid = true, FirstWarning = true,SecondWarning = true };
            Billing b = new Billing { ClientId = 4, Year = 2018, Month = 7, Paid = true, FirstWarning = true, SecondWarning = false };
            //Billing c = new Billing { ClientId = 8, Year = 2018, Month = 2, Paid = false, FirstWarning = false, SecondWarning = false };
            listForUpdate.Add(a);
            listForUpdate.Add(b);
            //listForUpdate.Add(c);

            //var update = _billingsMapper.UpdateBillings(listForUpdate);
            //var response = _billingsService.UpdateBillings(update);

            return View();
        }

        [HttpGet]
        public ActionResult GetWarnings(int clientId)
        {
            var request = _billingsMapper.GetClientWarningsRequest(clientId);
            var result = _billingsService.GetClientWarnings(request);

            return View();
        }

        [HttpGet]
        public ActionResult InsertWarning(int clientId, int warningType)
        {
            var warningDate = DateTime.Now;
            var request = _billingsMapper.InsertClientWarningRequest(clientId, warningDate, warningType);
            var result = _billingsService.InsertClientWarning(request);

            return View();
        }


        [HttpGet]
        public ActionResult AllUsers(int year = 0, int period = 3, int size = 0)
        {
            //Pitati Nikija kako se izvlace ove stvari(verovatno Session - majmun Niki)

            int start = 0;
            int end = 0;
            var currMonth = DateTime.Now.Month;
            if(size == 0)
            {
                start = currMonth - (period-1);
                end = currMonth;
            }
            else
            {
                end = currMonth + size * period;
                start = end - (period-1);
            }

            //Handling if end month exceed 12. month(December)
            if(end > 12)
            {
                end = 12;
                start = currMonth;
            }


            //Handling if start month is lower than 1. month(Januar)
            if (start < 1)
            {
                start = 1;
                end = start + (period-1);
            }

            if (year <= 0)
            {
                year = DateTime.Now.Year;
            }

            //Get Settings
            var requestForTimes = _settingsMapper.GetTimesRequest();
            var resultForTimes = _settingsService.GetAdminTimes(requestForTimes);
            var firstWarningDeadline = resultForTimes.Times.FirstOrDefault(x => x.TimeName == "FirstWarningDeadline").Value;
            var secondWarningDeadline = resultForTimes.Times.FirstOrDefault(x => x.TimeName == "SecondWarningDeadline").Value;

            //Get all clients
            var requestForClients = _clientsMapper.GetAllClientsRequest(Role.Admin, 1);
            var resultForClients = _clientsService.GetAllClients(requestForClients);
            var clients = resultForClients.Clients;

            //Get billings
            var requestForBillings = _billingsMapper.GetBillingsRequest(year);
            var resultForBillings = _billingsService.GetBillings(requestForBillings);

            var filtheredBillingsList = new List<Billing>();

            var currentTime = DateTime.Now;
            var currentMonth = currentTime.Month;
            var startMonth = currentMonth - (period-1);
            int minMonth = 0;
            bool hasRecords = false;

            if (startMonth <= 0)
            {
                startMonth = 1;
            }

            for(int i = start; i <= end; i++)
            {
                var monthBillings = resultForBillings.Billings.Where(x => x.Year == year && x.Month == i).ToList();
                if (monthBillings != null)
                {
                    filtheredBillingsList.AddRange(monthBillings);
                }
            }

            
            if (filtheredBillingsList.Count > 0)
            {
                minMonth = filtheredBillingsList.Min(x => x.Month);
            }


            var clientsBillings = new Dictionary<long, List<Billing>>();
            foreach(var client in clients)
            {
                var clientBillings = filtheredBillingsList.Where(x => x.ClientId == client.CustomerID).ToList();
                if(clientBillings.Count > 0)
                {
                    hasRecords = true;
                }
                clientsBillings.Add(client.CustomerID, clientBillings);
            }

            bool hasData = true;
            if(!hasRecords && year != DateTime.Now.Year)
            {
                hasData = false;
            }

            ViewData["clients"] = clients;
            ViewData["clientsBillings"] = clientsBillings;
            ViewData["minMonth"] = minMonth;
            ViewData["startMonth"] = startMonth;
            ViewData["hasRecords"] = hasRecords;
            ViewData["hasData"] = hasData;
            ViewData["year"] = year;

            ViewData["start"] = start;
            ViewData["end"] = end;
            ViewData["period"] = period;
            ViewData["size"] = size;
            ViewData["firstWarningDeadline"] = firstWarningDeadline;
            ViewData["secondWarningDeadline"] = secondWarningDeadline;
            return View();
        }

        public ActionResult ClientBilling(int clientId,int year)
        {
            var requestForBillings = _billingsMapper.GetBillingsRequest(year);
            var resultForBillings = _billingsService.GetBillings(requestForBillings);

            var requestForClients = _clientsMapper.GetAllClientsRequest(Role.Admin, 1);
            var resultForClients = _clientsService.GetAllClients(requestForClients);
            var client = resultForClients.Clients.Where(x => x.CustomerID == clientId).FirstOrDefault();
            if(client == null)
            {
                HttpContext.Response.StatusCode = 404;
                return Json(new { message = "Client not found!" });
            }

            var filtheredList = resultForBillings.Billings.Where(x => x.Year == year && x.ClientId == clientId).ToList();

            ViewData["filtheredList"] = filtheredList;
            ViewData["year"] = year;
            ViewData["client"] = client;

            return View();
        }

        private void HandleClientsWarnings(List<Billing> listOfBillings,int warningType)
        {
            var warningDate = DateTime.Now;
           
            foreach (var billing in listOfBillings)
            {
                var typeOfWarning = 0;

                if(warningType == 4)
                {
                    typeOfWarning = 2;

                }
                else if(warningType == 3)
                {
                    typeOfWarning = 1;
                }

                var request = _billingsMapper.InsertClientWarningRequest((int)billing.ClientId, warningDate, typeOfWarning);
                var updateWarnings = _billingsService.InsertClientWarning(request);

                SendMailToClient(billing.ClientId, billing.Month, billing.Year,typeOfWarning);

                var hasPenalty = CheckForWarnings((int)billing.ClientId);

                if (hasPenalty)
                {
                    SendMailToAdmin(billing.ClientId, billing.Month, billing.Year);
                }
            }
        }

        private void SendMailToClient(long clientId,int month,int year,int typeOfWarning)
        {
            var requestForClients = _clientsMapper.GetAllClientsRequest(Role.Admin, 1);
            var resultForClients = _clientsService.GetAllClients(requestForClients);
            var client = resultForClients.Clients.Where(x => x.CustomerID == clientId).FirstOrDefault();
            //Izmeniti i prilagoditi tekst poruke(iskoristiti mesec ,godinu i warning type)
            if (typeOfWarning == 1)
            {
                SendMail(client.ResponsiblePersonMail, "Opomena za placanje", "Postovani, Izmirite svoje obaveze.");
            }
            if(typeOfWarning == 2)
            {
                SendMail(client.ResponsiblePersonMail, "Opomena za placanje", "Postovani, Izmirite svoje obaveze.");
            }
        }

        private void SendMailToAdmin(long clientId, int month, int year)
        {
            //Uzeti mail admina i prilagoditi poruku za admina
            SendMail("", "Opomena za placanje", "Postovani, Izmirite svoje obaveze.");
        }

        private bool CheckForWarnings(int clientId)
        {
            var ret = false;
            var request = _billingsMapper.GetClientWarningsRequest(clientId);
            var result = _billingsService.GetClientWarnings(request);

            if(result != null)
            {
                var secondWarnings = result.Where(x => x.WarningType == 2).ToList();
                if(secondWarnings != null && secondWarnings.Count == 3)
                {
                    ret = true;
                }
                else
                {
                    ret = false;
                }
            }

            return ret;
        }


        private void SendMail(string toMail, string subject, string messageText)
        {
            var message = new MailMessage { From = new MailAddress(ConfigurationManager.AppSettings["FromMail"]) };

            //foreach (var email in toMail)
            //{
            message.To.Add(toMail);
            //}

            message.Subject = subject;

            message.IsBodyHtml = true;
            message.Body = messageText;

            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            var username = smtpSection.Network.UserName;
            var password = smtpSection.Network.Password;

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                client.Credentials = new System.Net.NetworkCredential(username, password);
            }

            client.Send(message);
        }




    }
}