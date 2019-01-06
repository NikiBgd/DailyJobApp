using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DailyJob.Models
{
    [Serializable]
    public class InsertNewReportInputModel
    {
        public string ColumnName { get; set; }
        public long TypeID { get; set; }
        public bool IsDateRelated { get; set; }
        public int MonthlyPeriod { get; set; }
        public int Ordering { get; set; }
    }
}