using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DailyJob.Models
{
    public class UpdateReportDataInputModel
    {
        public long ClientId { get; set; }
        public long ReportId { get; set; }
        public List<ReportData> ReportData { get; set; }
    }
}