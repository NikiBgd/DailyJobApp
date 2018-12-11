using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.Mappers.Requests.Billings;
using DataBaseCommunication.Mappers.Response.Billings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Services.Interface
{
    public interface IBillingsService
    {
        BillingsResponse GetBillings(BillingsRequest request);
        bool UpdateBillings(UpdateBillings requst);
        List<ClientWarnings> GetClientWarnings(GetClientWarningsRequest request);
        bool InsertClientWarning(InsertClientWarningRequest request);
        Billing GetBilling(long clientId, int year, int month);
    }
}
