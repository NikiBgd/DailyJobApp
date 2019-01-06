using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Services.Clients
{
    public class CreationsSearchCriteria
    {
        public string Name { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public DateTime StartDate { get; set; }
        public int? ClientType { get; set; }
        public bool? IsPaid { get; set; }
        public bool? IsConfirmed { get; set; }
        public bool? IsCanceled { get; set; }
        public bool? IsCompleted { get; set; }
    }
}
