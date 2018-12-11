using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.Mappers.Interfaces;
using DataBaseCommunication.Mappers.Requests.Billings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers
{
    public class BillingsMapper : IBillingsMapper
    {
        public BillingsRequest GetBillingsRequest(int year)
        {
            var request = new BillingsRequest { Year = year };
            return request;
        }

        public UpdateBillings UpdateBillings(List<Billing> billings,int actionType)
        {
            var request = new UpdateBillings { Billings = billings,BillingUpdateActionType = actionType };
            return request;
        }

        public GetClientWarningsRequest GetClientWarningsRequest(int clientId)
        {
            var request = new GetClientWarningsRequest
            {
                ClientId = clientId
            };

            return request;
        }

        public InsertClientWarningRequest InsertClientWarningRequest(int clientId, DateTime warningDate, int warningType)
        {
            var request = new InsertClientWarningRequest
            {
                ClientId = clientId,
                WarningDate = warningDate,
                WarningType = warningType
            };

            return request;
        }
    }
}
