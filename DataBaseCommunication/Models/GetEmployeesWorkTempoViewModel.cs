using DailyJobStarterPack.DataBaseObjects;
using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataBaseCommunication
{
    public class GetEmployeesWorkTempoViewModel
    {
        public UserProfile Employee { get; set; }
        public List<MonthlyStats> MonthlyStats { get; set; } 
    }
}