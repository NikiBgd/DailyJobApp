using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Models
{
    public class MonthlyStats
    {
        public int Month { get; set; }
        public Dictionary<int, int> Statuses {get; set;}
    }
}
