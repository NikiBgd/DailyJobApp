using DailyJobStarterPack.DataBaseObjects;
using DailyJobStarterPack.DataBaseObjects.Mappers;
using DailyJobStarterPack.DataBaseObjects.Mappers.Interfaces;
using DailyJobStarterPack.Web.Caching;
using DailyJobStarterPack.Web.Services;
using DailyJobStarterPack.Web.ViewModels.Objects;
using DailyJobStarterPack.Web.ViewModels.Security;
using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.Mappers;
using DataBaseCommunication.Mappers.Interfaces;
using DataBaseCommunication.Services;
using DataBaseCommunication.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;

namespace DailyJobStarterPack.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private readonly IUserService _userService;
        private readonly IUsersMapper _userMapper;
        private readonly IClientsService _clientsService;
        private readonly IClientsMapper _clientsMapper;
        private readonly ISettingsService _settingsService;
        private readonly ISettingsMapper _settingsMapper;

        public AccountController()
            : this(new UserService(), new UsersMapper(), new ClientsService(), new ClientsMapper(), new SettingsService(), new SettingsMapper())
        {
        }

        public AccountController(IUserService usersService, IUsersMapper usersMapper, IClientsService clientsService, IClientsMapper clientsMapper, ISettingsService settingsService, ISettingsMapper settingsMapper)
        {
            _userService = usersService;
            _userMapper = usersMapper;
            _clientsService = clientsService;
            _clientsMapper = clientsMapper;
            _settingsService = settingsService;
            _settingsMapper = settingsMapper;
        }


        [AllowAnonymous]
        [HttpGet]
        public ActionResult LoginUsernamePassword()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpGet]
        public ActionResult LogOut()
        {
            SessionData.User = null;
            return RedirectToAction("LoginUsernamePassword");
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult LoginUsernamePassword(UsernamePasswordLoginModel model)
        {
            if (ModelState.IsValid)
            {
                var request = _userMapper.GetUserUserNamePassWordRequest(model.UserName, model.Password);
                var result = _userService.Login(request);

                if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success)
                {
                    if (result.User != null)
                    {
                        FormsAuthentication.SetAuthCookie(model.UserName, false);
                        SessionData.User = result.User;
                        System.Web.HttpContext.Current.Cache["UserId"] = result.User.Id;

                        //get settings
                        if (result.User.Role == Role.Admin)
                        {
                            var requestForSettings = _settingsMapper.GetSettings();
                            var resultForSettings = _settingsService.GetAdminSettings(requestForSettings);

                            SessionData.Settings = resultForSettings.Settings;

                            var requestForServices = _settingsMapper.GetServicesRequest();
                            var resultForServices = _settingsService.GetAdminServices(requestForServices);

                            SessionData.Services = resultForServices.Services;

                            var requestForFirms = _settingsMapper.GetFirmsRequest();
                            var resultForFirms = _settingsService.GetAdminFirms(requestForFirms);

                            SessionData.Firms = resultForFirms.Firms;

                            var requestForTimes = _settingsMapper.GetTimesRequest();
                            var resultForTimes = _settingsService.GetAdminTimes(requestForTimes);

                            SessionData.Times = resultForTimes.Times;
                        }

                        //get customers
                        var requestForClients = _clientsMapper.GetAllClientsRequest(result.User.Role, result.User.Team.Id);
                        var resultForClients = _clientsService.GetAllClients(requestForClients);

                        var nbsService = new NBSService();
                        //exchange if needed
                        foreach (var client in resultForClients.Clients)
                        {
                            if (client.AmountCode.ToLower() == "rsd")
                            {
                                client.LocalAmount = client.Amount;
                            }
                            else
                            {
                                var localAmount = nbsService.ChangeToRsd(client.AmountCode, "rsd", client.Amount, "sre");
                                client.LocalAmount = Decimal.Parse(localAmount.Result.Value);
                            }
                        }

                        SessionData.Clients = resultForClients.Clients;


                        //get courier
                        var requestForCouriers = _userMapper.GetAllCouriersRequest();
                        var resultForCouriers = _userService.GetAllCouriers(requestForCouriers);

                        SessionData.Courires = resultForCouriers.Couriers;

                        if (result.User.Role == Role.Admin || result.User.Role == Role.TeamLead)
                        {
                            var requestForUsers = _userMapper.GetAllUsersRequest(result.User.Team.Id, result.User.Role);
                            var resultForUsers = _userService.GetAllUsers(requestForUsers);

                            SessionData.Users = resultForUsers.Users;
                        }

                        var cacheProvider = new InMemoryCache();
                        var listFromCashe = cacheProvider.Get<Kursnalista>("kursnaLista");

                        if (listFromCashe == null)
                        {
                            SessionData.KursnaLista = nbsService.GetList();
                            //TODO: FIX CAHING TIME
                            cacheProvider.Set<Kursnalista>("kursnaLista", SessionData.KursnaLista, 12 * 60);
                        }
                        else
                        {
                            SessionData.KursnaLista = listFromCashe;
                        }

                        var listaTaskova = new List<Task>();
                        Task t1 = new Task
                        {
                            Id = 1,
                            Title = "Upis novih clanova",
                            Description = "Ovo mora danas da se zavris",
                            IsDone = true,
                            TaskDate = DateTime.Today,
                            ClientId = 1024,
                            UserId = 1
                        };
                        Task t2 = new Task
                        {
                            Id = 2,
                            Title = "Igra prestola",
                            Description = "2 epoizode danas",
                            IsDone = false,
                            TaskDate = DateTime.Today,
                            ClientId = 1028,
                            UserId = 1
                        };

                        listaTaskova.Add(t1);
                        listaTaskova.Add(t2);

                        SessionData.Tasks = listaTaskova;


                        model.RedirectToUrl = "/Page";
                        return View(model);
                    }
                    else
                    {
                        model.Errors.Add("Pogresno korisnicko ime ili lozinka");
                        return View(model);
                    }
                }
                else
                {
                    model.Errors.Add(result.ResponseDescription);
                    return View(model);
                }
            }

            foreach (var val in ModelState.Values.Where(v => v.Errors.Count > 0))
            {
                foreach (var error in val.Errors)
                {
                    model.Errors.Add(error.ErrorMessage);
                }

            }

            return View(model);


        }



        [HttpGet]
        [AllowAnonymous]
        public ActionResult ChangeData()
        {
            return View(SessionData.User);
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult ChangeData(UserProfile user)
        {
            user.UserName = SessionData.User.UserName;
            user.Password = string.IsNullOrEmpty(user.Password) ? SessionData.User.Password : user.Password;
            user.Id = SessionData.User.Id;

            var request = _userMapper.GetChangeDataRequest(user);
            var result = _userService.UpdateData(request);
            if (result.isSuccessful)
            {
                //update user data
                SessionData.User = result.NewUser;
                ViewData["isSuccessful"] = true;
            }

            return View(SessionData.User);
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult ChangeUserData(int userId)
        {
            return View(SessionData.Users.FirstOrDefault(x => x.Id == userId));
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult ChangeUserData(UserProfile user, int TeamId)
        {
            user.Team = new Team()
            {
                Id = TeamId
            };
            var request = _userMapper.GetChangeDataRequest(user);
            var result = _userService.UpdateData(request);
            if (result.isSuccessful)
            {
                //update user data
                ViewData["isSuccessful"] = true;

                if (SessionData.User.Id == user.Id)
                {
                    SessionData.User = result.NewUser;
                }

                var requestForAllUsers = _userMapper.GetAllUsersRequest(SessionData.User.Team.Id, SessionData.User.Role);
                var resultForAllUsers = _userService.GetAllUsers(requestForAllUsers);

                //update session data
                if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success)
                {
                    if (resultForAllUsers.Users != null && resultForAllUsers.Users.Any())
                    {
                        SessionData.Users = resultForAllUsers.Users;
                    }
                }
            }

            return View(SessionData.User);
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult AddUser()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult AddUser(UserProfile user)
        {
            user.Team = new Team
            {
                Id = user.Id
            };

            var request = _userMapper.GetAddUserRequest(user);
            var result = _userService.AddUser(request);

            if (result.isSuccessful)
            {
                ViewData["isSuccessful"] = true;
            }

            return View();
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult AllUsers()
        {
            var request = _userMapper.GetAllUsersRequest(SessionData.User.Team.Id, SessionData.User.Role);
            var result = _userService.GetAllUsers(request);

            //update session data
            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success)
            {
                if (result.Users != null && result.Users.Any())
                {
                    SessionData.Users = result.Users;
                }
            }

            return View(result.Users);
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult DeleteUser(int userId)
        {
            var request = _userMapper.GetDeleteUserRequest(userId);
            var result = _userService.DeleteUser(request);


            //update session data
            if (result.ResponseStatus == DataBaseCommunication.Mappers.Response.ResponseStatus.Success)
            {

                var requestForUsers = _userMapper.GetAllUsersRequest(SessionData.User.Team.Id, SessionData.User.Role);
                var resultForUsers = _userService.GetAllUsers(requestForUsers);

                if (resultForUsers.Users != null && resultForUsers.Users.Any())
                {
                    SessionData.Users = resultForUsers.Users;
                }
            }
            return Json(result);
        }
    }

}