using DataBaseCommunication.Mappers.Requests.WorkTempo;
using DataBaseCommunication.Mappers.Response.WorkTempo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Services.Interface
{
    public interface IWorkTempoService
    {
        WorkTempoResponse GetWorkTempoByEmpoloyeeId(GetWorkTempoByEmpoloyeeIdRequest request);
        UpdateEmpolyeeWorkTempoResponse UpdateEmployeeWorkTempo(UpdateEmployeeWorkTempoRequest request);
        GetEmployeesWorkTempoResponse GetEmployeesWorkTempo(GetEmployeesWorkTempoRequest request);
    }
}
