using DataBaseCommunication.Services.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataBaseCommunication.Mappers.Requests.Users;
using DataBaseCommunication.Mappers.Response.Users;
using DataBaseCommunication.Mappers.Response;
using DataBaseCommunication.Mappers.Requests;
using DataBaseCommunication.DataProviders;
using DataBaseCommunication.Mappers.Requests.Clients;
using DataBaseCommunication.Mappers.Response.Clients;
using DataBaseCommunication.Helpers;
using DailyJobStarterPack.DataBaseObjects;
using DailyJob.Models;

namespace DataBaseCommunication.Services
{
    public class ClientsService : IClientsService
    {

        AllTimesForClientResponse IClientsService.GetAllTimesForClient(AllTimesForClientRequest request)
        {
            var response = new AllTimesForClientResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.Times = clientsProvider.GetAllClientTimes(request);
                    response.DateFrom = request.DateFrom;
                    response.DateTo = request.DateTo;
                    response.ClientId = request.ClientId;
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;

        }

        public AllWorkerOrdersForClientResponse GetAllWorkerOrdersForClient(AllWorkerOrdersForClientRequest request)
        {
            var response = new AllWorkerOrdersForClientResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.Orders = clientsProvider.GetAllClientWorkerOrders(request);
                    response.DateFrom = request.DateFrom;
                    response.DateTo = request.DateTo;
                    response.ClientId = request.ClientId;
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public AllClientsResponse GetAllClients(AllClientsRequest request)
        {
            var response = new AllClientsResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.Clients = clientsProvider.GetAllClients(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }


        ClientServicesResponse IClientsService.GetClientServices(ClientServicesRequest request)
        {
            var response = new ClientServicesResponse { ResponseStatus = ResponseStatus.Success };

            response.ClientId = request.ClientId;

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.Services = clientsProvider.GetClientServices(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public ClientChangesResponse GetClientChanges(ClientChangesRequest request)
        {
            var response = new ClientChangesResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.Changes = clientsProvider.GetAllChanges(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        //public List<ReportData> Fejk(ClientChangesRequest request)
        //{
        //    var ret = new List<ReportData>();
        //    var response = new ClientChangesResponse { ResponseStatus = ResponseStatus.Success };

        //    var clientsProvider = new ClientsProvider();
        //    try
        //    {
                
        //            ret = clientsProvider.GetDataReportsByClientIDAndReportID(request);
                
      
        //    }
        //    catch (Exception ex)
        //    {
        //        response.ResponseStatus = ResponseStatus.Failure;
        //        response.ResponseDescription = ex.Message;
        //    }
        //    return ret;
        //}

        public List<ReportData> GetReportDetails(GetReportDetailsRequest request)
        {
            var ret = new List<ReportData>();
            var response = new ClientChangesResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                ret = clientsProvider.GetDataReportsByClientIDAndReportID(request);
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return ret;
        }

        public List<ReportData> GetUniqueReportData(GetReportDetailsRequest request)
        {
            var ret = new List<ReportData>();
            var response = new ClientChangesResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                ret = clientsProvider.GetUniqueReportData(request);
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return ret;
        }

        public bool UpdateReportData(UpdateReportDataRequest request)
        {
            var clientsProvider = new ClientsProvider();

            foreach (var data in request.ReportData)
            {
                var response = clientsProvider.UpdateReportData(data);
            }
            return true;
        }

        public bool InsertReportData(InsertReportDataRequest request)
        {
            var clientsProvider = new ClientsProvider();

            foreach (var data in request.ReportData)
            {
                var response = clientsProvider.InsertReportData(data);
            }
            return true;
        }

        public ReportsResponse GetReports(ReportsRequest request)
        {
            var response = new ReportsResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.Reports = clientsProvider.GetClientReports(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }

            return response;
        }

        public LogTimeResponse LogTime(LogTimeRequest request)
        {
            var response = new LogTimeResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Insert)
                {
                    response.isSuccessful = clientsProvider.LogTime(request);
                    if (response.isSuccessful)
                    {

                        var refreshClientsRequest = new AllClientsRequest
                        {
                            ActionType = ActionType.Select,
                            Role = request.Role,
                            TeamId = request.TeamId
                        };

                        var clientsResponse = GetAllClients(refreshClientsRequest);
                        response.NewClientsList = clientsResponse.Clients;
                    }
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public LogWorkersOrderResponse LogWorkerOrder(LogWorkersOrderRequest request)
        {
            var response = new LogWorkersOrderResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Insert)
                {
                    response.isSuccessful = clientsProvider.LogWorkerOrder(request);
                    if (response.isSuccessful)
                    {

                        var refreshClientsRequest = new AllClientsRequest
                        {
                            ActionType = ActionType.Select,
                            Role = request.Role,
                            TeamId = request.TeamId
                        };

                        var clientsResponse = GetAllClients(refreshClientsRequest);
                        response.NewClientsList = clientsResponse.Clients;
                    }
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;

        }


        public UpdateClientServicesResponse UpdateClientServices(UpdateClientServicesRequest request)
        {
            var response = new UpdateClientServicesResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Update)
                {
                    response.isSuccessful = clientsProvider.ChangeClientServices(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }


        public UpdateClientResponse UpdateClientData(UpdateClientRequest request)
        {
            var response = new UpdateClientResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Update)
                {
                    response.isSuccessful = clientsProvider.ChangeClientData(request);
                    if (response.isSuccessful)
                    {

                        var refreshClientsRequest = new AllClientsRequest
                        {
                            ActionType = ActionType.Select,
                            Role = request.Role,
                            TeamId = request.TeamId
                        };

                        var clientsResponse = GetAllClients(refreshClientsRequest);
                        response.NewClientsList = clientsResponse.Clients;

                        //Log all changes
                        List<Change> changes = ClientsHelper.GetAllChanges(request.Client, request.OldClientProfile);
                        response.isSuccessful = clientsProvider.LogClientChanges(changes, request.Client.CustomerID, request.UserId);
                    }
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public UpdateClientStatusResponse UpdateClientStatus(UpdateClientStatusRequest request)
        {
            var response = new UpdateClientStatusResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Update)
                {
                    response.isSuccessful = clientsProvider.UpdateClientStatus(request);
                    if (response.isSuccessful)
                    {

                        var refreshClientsRequest = new AllClientsRequest
                        {
                            ActionType = ActionType.Select,
                            Role = request.Role,
                            TeamId = request.TeamId
                        };

                        var clientsResponse = GetAllClients(refreshClientsRequest);
                        response.NewClientsList = clientsResponse.Clients;
                    }
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }


        public NewClientResponse AddNewClient(NewClientRequest request)
        {
            var response = new NewClientResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Insert)
                {
                    response.isSuccessful = clientsProvider.InsertClientData(request);
                    if (response.isSuccessful)
                    {

                        var refreshClientsRequest = new AllClientsRequest
                        {
                            ActionType = ActionType.Select,
                            Role = request.Role,
                            TeamId = request.TeamId
                        };

                        var clientsResponse = GetAllClients(refreshClientsRequest);
                        response.NewClientsList = clientsResponse.Clients;
                    }
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public ChangeClientReportsResponse ChangeClientReports(ChangeClientReportsRequest request)
        {
            var response = new ChangeClientReportsResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Update)
                {
                    response.isSuccessful = clientsProvider.ChangeClientsReports(request);
                    if (response.isSuccessful)
                    {

                       
                    }
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public RelatedCompaniesResponse GetRelatedCompanies(RelatedCompaniesRequest request)
        {
            var response = new RelatedCompaniesResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Select)
                {
                    response.RelatedCompanies = clientsProvider.GetRelatedCompanies(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }

            return response;
        }

        public DeleteRelatedCompanyResponse DeleteRelatedComapny(DeleteRelatedCompanyRequest request)
        {
            var response = new DeleteRelatedCompanyResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Delete)
                {
                    response.isSuccessful = clientsProvider.DeleteRelatedCompany(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }

        public AddRelatedCompanyResponse AddRelatedComapny(AddRelatedCompanyRequest request)
        {
            var response = new AddRelatedCompanyResponse { ResponseStatus = ResponseStatus.Success };

            var clientsProvider = new ClientsProvider();
            try
            {
                if (request.ActionType == ActionType.Insert)
                {
                    response.isSuccessful = clientsProvider.InsertRelatedComapny(request);
                }
                else
                {
                    response.ResponseStatus = ResponseStatus.Failure;
                    response.ResponseDescription = "Not update action";
                }
            }
            catch (Exception ex)
            {
                response.ResponseStatus = ResponseStatus.Failure;
                response.ResponseDescription = ex.Message;
            }
            return response;
        }
    }
}
