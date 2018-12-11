using DataBaseCommunication.DataBaseObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Requests.Billings
{
    public class BillingsRequest : Request
    {
        public int Year { get; set; }
    }

    public class UpdateBillings : Request
    {
        public List<Billing> Billings { get; set; }
        public int BillingUpdateActionType { get; set; }
    }

    public class GetClientWarningsRequest : Request
    {
        public int ClientId { get; set; }
    }

    public class InsertClientWarningRequest : Request
    {
        public int ClientId { get; set; }
        public DateTime WarningDate { get; set; }
        public int WarningType { get; set; }
    }
}
