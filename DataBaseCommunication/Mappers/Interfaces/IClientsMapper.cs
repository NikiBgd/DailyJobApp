using DataBaseCommunication.Mappers.Requests.Clients;
using DataBaseCommunication.Mappers.Requests.Users;
using System.Collections.Generic;
using System;
using DailyJob.Models;

namespace DailyJobStarterPack.DataBaseObjects.Mappers.Interfaces
{
    public interface IClientsMapper
    {
        AllClientsRequest GetAllClientsRequest(Role role, int teamId);
        UpdateClientRequest GetUpdateUserDateRequest(ClientProfile client, Role role, int teamId, int userId, ClientProfile oldClientProfile);
        ClientChangesRequest GetClientChangesRequest(int clientId);
        LogTimeRequest GetLogTimeRequest(int clientId, decimal time, int userId, Role role, int teamId);
        ReportsRequest GetReportsRequest(int clientId);
        NewClientRequest GetNewClientRequest(ClientProfile client, Role role, int teamId);
        ClientServicesRequest GetClientServicesRequest(int clientId);
        UpdateClientServicesRequest UpdateClientServicesRequest(int clientId, List<int> services);
        LogWorkersOrderRequest GetWorkersOrderRequest(int clientId, int courierId, int userId, Role role, int teamId);
        AllTimesForClientRequest GetAllTimesForClientRequest(int clientId, DateTime startDate, DateTime endDate);
        AllWorkerOrdersForClientRequest GetAllWorkerOrdersForClientRequest(int clientId, DateTime startDate, DateTime endDate);
        GetReportDetailsRequest GetReportDetailsRequest(long clientId,long reportId,int year);
        UpdateReportDataRequest UpdateReportDataRequest(long clientId, long reportId, List<ReportData> reportData);
        InsertReportDataRequest InsertReportDataRequest(long clientId, long reportId, List<ReportData> reportData);
        UpdateClientStatusRequest GetUpdateClientStatusRequest(int clientId, int status, Role role, int teamId, string reason);
        ChangeClientReportsRequest GetChangeClientReportsReqeuest(int clientId, string reportData);
        RelatedCompaniesRequest GetRelatedCompaniesRequest(int clientId);
        DeleteRelatedCompanyRequest GetDeleteRelatedCompanyRequest(int companyId, int relatedCompanyId);
        AddRelatedCompanyRequest GetAddRelatedCompanyRequest(int companyId, int relatedCompanyId);
    }
}
