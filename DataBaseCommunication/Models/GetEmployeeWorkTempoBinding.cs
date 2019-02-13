using DailyJobStarterPack.DataBaseObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Models
{
    //LEGACY CODE
    public class GetEmployeeWorkTempoBinding
    {
        public UserProfile Employee { get; set; }
        public List<MonthlyStatsBinding> MonthlyStats { get; set; }
    }
}
