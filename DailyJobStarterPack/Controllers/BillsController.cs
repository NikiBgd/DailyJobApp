using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DailyJob.Controllers
{
    public class BillsController : Controller
    {
        public ActionResult CreateBill(int companyId, int clientId)
        {
            return View();
        }

        public ActionResult CreateBillForCreation(int companyId, int creationId)
        {
            return View();
        }
    }
}