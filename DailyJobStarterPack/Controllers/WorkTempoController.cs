using DataBaseCommunication.Mappers;
using DataBaseCommunication.Mappers.Interfaces;
using DataBaseCommunication.Services;
using DataBaseCommunication.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;

namespace DailyJob.Controllers
{
    public class WorkTempoController : Controller
    {
        private readonly IWorkTempoService _workTempoService;
        private readonly IWorkTempoMapper _workTempoMapper;

        public WorkTempoController()
            : this(new WorkTempoService(), new WorkTempoMapper())
        {
        }

        public WorkTempoController(IWorkTempoService workTempoService, IWorkTempoMapper workTempoMapper)
        {
            _workTempoService = workTempoService;
            _workTempoMapper = workTempoMapper;
        }

        [HttpGet]
        public ActionResult Tardara()
        {
            var api1 = GetWorkTempoByEmpoloyeeId(2, 1, 2018);
            var api2 = UpdateEmployeeWorkTempo(1, 2, "2018-01-02");
            var api3 = GetEmployeesWorkTempo(2018);

            return View();

        }


        [HttpGet]
        public ActionResult GetWorkTempoByEmpoloyeeId (int employeeId, int month, int year)
        {
            var request = _workTempoMapper.GetWorkTempoByEmpoloyeeIdRequest(employeeId, month, year);
            var result = _workTempoService.GetWorkTempoByEmpoloyeeId(request);

            return View(result);
        }

        [HttpPost]
        public ActionResult UpdateEmployeeWorkTempo(int employeeId, int status, string date)
        {
            var newDate = DateTime.ParseExact(date, "yyyy-MM-dd",
                                       System.Globalization.CultureInfo.InvariantCulture);
            var request = _workTempoMapper.UpdateEmployeeWorkTempoRequest(employeeId, status, newDate);
            var result = _workTempoService.UpdateEmployeeWorkTempo(request);

            return View(result);
        }

        [HttpGet]
        public ActionResult GetEmployeesWorkTempo(int year)
        {
            var request = _workTempoMapper.GetEmployeesWorkTempoRequest(year);
            var result = _workTempoService.GetEmployeesWorkTempo(request);

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}