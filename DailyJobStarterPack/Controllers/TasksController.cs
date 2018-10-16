using DailyJobStarterPack.Web.ViewModels.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DailyJobStarterPack.Controllers
{
    [AllowAnonymous]
    public class TasksController : Controller
    {
        // GET: Page
        public ActionResult ActiveTasks(int clientId)
        {
            var activeTasks = SessionData.Tasks.Where(x => x.ClientId == clientId);
            return View(activeTasks);
        }
    }
}