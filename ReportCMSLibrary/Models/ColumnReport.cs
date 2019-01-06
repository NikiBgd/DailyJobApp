using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReportCMSLibrary.Models
{
    public class ColumnReport
    {
        public string ColumnName { get; set; }
        public long TypeID { get; set; }
        public bool IsDateRelated { get; set; }
        public int MonthlyPeriod { get; set; }
        public int Ordering { get; set; }
    }
}
