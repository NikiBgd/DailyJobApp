using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.DataBaseObjects
{
    public class Billing
    {
        public long Id { get; set; }
        public long ClientId { get; set; }
        public bool Paid { get; set; }
        public bool FirstWarning { get; set; }
        public bool SecondWarning { get; set; }
        public int Year { get; set; }
        public int Month { get; set; }
    }
}
