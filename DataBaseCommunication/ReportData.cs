using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DailyJob.Models
{
    [Serializable]
    public class ReportData
    {
        public long ClientID { get; set; }
        public long ReportID { get; set; }
        public long TypeID { get; set; }
        public string ColumnName { get; set; }
        public bool IsDateRelated { get; set; }
        public int MonthlyPeriod { get; set; }
        public int Ordering { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }
        public DateTime DateValue { get; set; }
        public string TextValue { get; set; }
        public bool BoolValue { get; set; }
        public string Type { get; set; }
    }
}