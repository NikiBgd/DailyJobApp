using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.DataProviders;
using DataBaseCommunication.Mappers.Requests.Billings;
using DataBaseCommunication.Mappers.Response;
using DataBaseCommunication.Mappers.Response.Billings;
using DataBaseCommunication.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Services
{
    public class BillingsService : IBillingsService
    {
        public BillingsResponse GetBillings(BillingsRequest request)
        {
            var billingsProvider = new BillingsProvider();

            var billings = billingsProvider.GetBillingsByYear(request);

            var response = new BillingsResponse
            {
                Billings = billings
            };

            return response;
        }

        public bool UpdateBillings(UpdateBillings request)
        {
            var billingsProvider = new BillingsProvider();

            foreach(var billing in request.Billings)
            {
                var bill = billingsProvider.GetBilling(billing.ClientId, billing.Year, billing.Month);

                if(bill != null)
                {
                    SetBillingBasedOnActionType(request.BillingUpdateActionType, bill);
                    billingsProvider.UpdateBilling(bill);
                }
                else
                {
                    SetBillingBasedOnActionType(request.BillingUpdateActionType, billing);
                    billingsProvider.InsertBilling(billing);
                }
            }

            return true; 
        }

        public List<ClientWarnings> GetClientWarnings(GetClientWarningsRequest request)
        {
            var ret = new List<ClientWarnings>();
            var response = new ClientWarningsResponse { ResponseStatus = ResponseStatus.Success };

            var billingsProvider = new BillingsProvider();
            try
            {
                ret = billingsProvider.GetClientWarningsById(request);
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return ret;
        }

        public bool InsertClientWarning(InsertClientWarningRequest request)
        {
            var response = new InsertClientWarningResponse { ResponseStatus = ResponseStatus.Success };

            var billingsProvider = new BillingsProvider();
            try
            {
                billingsProvider.InsertClientWarning(request);
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return true;
        }

        public Billing GetBilling(long clientId,int year,int month)
        {
            var billingsProvider = new BillingsProvider();
            var billing = billingsProvider.GetBilling(clientId, year, month);
            return billing;
        }

        private void SetBillingBasedOnActionType(int actionType, Billing billing)
        {
            if (actionType == 1)
            {
                billing.Paid = true;
            }
            if (actionType == 2)
            {
                billing.Paid = false;
            }
            if (actionType == 3)
            {
                billing.FirstWarning = true;
            }
            if (actionType == 4)
            {
                billing.SecondWarning = true;
            }
        }

    }
}
