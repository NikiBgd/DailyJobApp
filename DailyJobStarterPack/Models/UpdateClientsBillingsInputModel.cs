using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DailyJob.Models
{
    
    public class UpdateClientsBillingsInputModel
    {
        public List<long> ClientIds { get; set; }
        public List<int> Months { get; set; }
        public int ActionType { get; set; }
        public int Year { get; set; }
    }
}