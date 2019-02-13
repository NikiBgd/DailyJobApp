using DataBaseCommunication.Mappers.Requests.WorkTempo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Interfaces
{
    public interface IWorkTempoMapper
    {
        GetWorkTempoByEmpoloyeeIdRequest GetWorkTempoByEmpoloyeeIdRequest(int employeeId, int month, int year);
        UpdateEmployeeWorkTempoRequest UpdateEmployeeWorkTempoRequest(int employeeId, int status, DateTime date);
        GetEmployeesWorkTempoRequest GetEmployeesWorkTempoRequest(int year);
    }
}
