using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Response.WorkTempo
{
    public class WorkTempoResponse : Response
    {
        public List<EmployeeWorkTempo> EmployeeWorkTempo { get; set; }
    }

    public class WorkTempoStatusResponse : Response
    {
        public List<WorkTempoStatus> WorkTempoStatus { get; set; }
    }

    public class UpdateEmpolyeeWorkTempoResponse : Response
    {
        public EmployeeWorkTempo EmployeeWorkTempo { get; set; }
    }

    public class GetEmployeesWorkTempoResponse : Response
    {
        public List<GetEmployeeWorkTempoBinding> EmployeeWorkTempo { get; set; }
        public List<WorkTempoStatus> WorkTempoStatus { get; set; }
    }

}
