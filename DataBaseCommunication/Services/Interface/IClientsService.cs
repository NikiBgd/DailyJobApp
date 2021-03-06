﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DailyJob.Models;
using DataBaseCommunication.Mappers.Requests.Clients;
using DataBaseCommunication.Mappers.Response.Clients;

namespace DataBaseCommunication.Services.Interface
{
    public interface IClientsService
    {
        AllClientsResponse GetAllClients(AllClientsRequest request);
        UpdateClientResponse UpdateClientData(UpdateClientRequest request);
        ClientChangesResponse GetClientChanges(ClientChangesRequest request);
        LogTimeResponse LogTime(LogTimeRequest request);
        ReportsResponse GetReports(ReportsRequest request);
        NewClientResponse AddNewClient(NewClientRequest request);
        ClientServicesResponse GetClientServices(ClientServicesRequest request);
        UpdateClientServicesResponse UpdateClientServices(UpdateClientServicesRequest request);
        LogWorkersOrderResponse LogWorkerOrder(LogWorkersOrderRequest request);
        AllTimesForClientResponse GetAllTimesForClient(AllTimesForClientRequest request);
        AllWorkerOrdersForClientResponse GetAllWorkerOrdersForClient(AllWorkerOrdersForClientRequest request);
        UpdateClientStatusResponse UpdateClientStatus(UpdateClientStatusRequest request);
        List<ReportData> GetReportDetails(GetReportDetailsRequest request);
        List<ReportData> GetUniqueReportData(GetReportDetailsRequest request);
        bool UpdateReportData(UpdateReportDataRequest request);
        bool InsertReportData(InsertReportDataRequest request);
        ChangeClientReportsResponse ChangeClientReports(ChangeClientReportsRequest request);
        RelatedCompaniesResponse GetRelatedCompanies(RelatedCompaniesRequest request);
        DeleteRelatedCompanyResponse DeleteRelatedComapny(DeleteRelatedCompanyRequest request);
        AddRelatedCompanyResponse AddRelatedComapny(AddRelatedCompanyRequest request);
    }
}
