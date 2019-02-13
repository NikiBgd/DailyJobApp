using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Models
{
    public class MonthlyStatsBinding
    {
        public int Month { get; set; }
        public List<FormattedMonthlyStats> Statuses { get; set; }
    }
}
