using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.Mappers.Requests.Billings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Interfaces
{
    public interface IBillingsMapper
    {
        BillingsRequest GetBillingsRequest(int year);
        UpdateBillings UpdateBillings(List<Billing> billings, int actionType);
        GetClientWarningsRequest GetClientWarningsRequest(int clientId);
        InsertClientWarningRequest InsertClientWarningRequest(int clientId, DateTime warningDate, int warningType);
    }
}
