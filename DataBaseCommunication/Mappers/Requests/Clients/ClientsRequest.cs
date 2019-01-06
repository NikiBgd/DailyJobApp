using DailyJobStarterPack.DataBaseObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DailyJob.Models;

namespace DataBaseCommunication.Mappers.Requests.Clients
{
    public class AllClientsRequest : Request
    {
        public Role Role { get; set; }
        public int TeamId { get; set; }
    }

    public class AllTimesForClientRequest : Request
    {
        public int ClientId { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
    }

    public class AllWorkerOrdersForClientRequest : Request
    {
        public int ClientId { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
    }

    public class ClientServicesRequest : Request
    {
        public int ClientId { get; set; }
    }

    public class NewClientRequest : Request
    {
        public ClientProfile Client { get; set; }
        public Role Role { get; set; }
        public int TeamId { get; set; }
    }

    public class UpdateClientRequest : Request
    {
        public ClientProfile Client { get; set; }
        public Role Role { get; set; }
        public int TeamId { get; set; }
        public int UserId { get; set; }
        public ClientProfile OldClientProfile { get; set; }
    }

    public class UpdateClientStatusRequest : Request
    {
        public int ClientId { get; set; }
        public int Status { get; set; }
        public Role Role { get; set; }
        public int TeamId { get; set; }
        public string Reason { get; set; }
    }

    public class UpdateClientServicesRequest : Request
    {
        public List<int> NewServices { get; set; }
        public int ClientId { get; set; }
    }

    public class ClientChangesRequest : Request
    {
        public int ClientId { get; set; }
    }

    public class LogTimeRequest : Request
    {
        public int ClientId { get; set; }
        public int UserId { get; set; }
        public decimal Time { get; set; }
        public Role Role { get; set; }
        public int TeamId { get; set; }
    }

    public class LogWorkersOrderRequest : Request
    {
        public int ClientId { get; set; }
        public int UserId { get; set; }
        public int CourierId { get; set; }
        public Role Role { get; set; }
        public int TeamId { get; set; }
    }

    public class ReportsRequest : Request
    {
        public int ClientId { get; set; }
    }

    public class GetReportDetailsRequest : Request
    {
        public long ClientId { get; set; }
        public long ReportId { get; set; }
        public int Year { get; set; }
    }

    public class UpdateReportDataRequest : Request
    {
        public long ClientId { get; set; }
        public long ReportId { get; set; }
        public List<ReportData> ReportData { get; set; }
    }

    public class InsertReportDataRequest : Request
    {
        public long ClientId { get; set; }
        public long ReportId { get; set; }
        public List<ReportData> ReportData { get; set; }
    }

    public class ChangeClientReportsRequest : Request
    {
        public long ClientId { get; set; }
        public string ReportData { get; set; }
    }

    public class RelatedCompaniesRequest : Request
    {
        public long ClientId { get; set; }
    }

    public class DeleteRelatedCompanyRequest : Request
    {
        public long ClientId { get; set; }
        public long RelatedClientId { get; set; }
    }

    public class AddRelatedCompanyRequest : Request
    {
        public long ClientId { get; set; }
        public long RelatedClientId { get; set; }
    }
}
