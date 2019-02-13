using DataBaseCommunication.Mappers.Interfaces;
using DataBaseCommunication.Mappers.Requests.WorkTempo;
using System;

namespace DataBaseCommunication.Mappers
{
    public class WorkTempoMapper : IWorkTempoMapper
    {
        public GetWorkTempoByEmpoloyeeIdRequest GetWorkTempoByEmpoloyeeIdRequest(int employeeId, int month, int year)
        {
            var request = new GetWorkTempoByEmpoloyeeIdRequest
            {
                EmployeeId = employeeId,
                Month = month,
                Year = year
            };

            return request;
        }

        public UpdateEmployeeWorkTempoRequest UpdateEmployeeWorkTempoRequest (int employeeId, int status, DateTime date)
        {
            var request = new UpdateEmployeeWorkTempoRequest
            {
                EmployeeId = employeeId,
                Status = status,
                Date = date
            };

            return request;
        }

        public GetEmployeesWorkTempoRequest GetEmployeesWorkTempoRequest(int year)
        {
            var request = new GetEmployeesWorkTempoRequest
            {
               Year = year
            };

            return request;
        }
    }
}
