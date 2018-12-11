using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.DataBaseObjects
{
    [Serializable]
    public class ClientWarnings
    {
        public int ID { get; set; }
        public int ClientID { get; set; }
        public DateTime WarningDate { get; set; }
        public int WarningType { get; set; }
    }
}
