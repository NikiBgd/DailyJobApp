using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Requests.WorkTempo
{
    public class WorkTempoRequest : Request
    {
    }

    public class GetWorkTempoByEmpoloyeeIdRequest : Request
    {
        public int EmployeeId { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
    }

    public class UpdateEmployeeWorkTempoRequest : Request
    {
        public int EmployeeId { get; set; }
        public int Status { get; set; }
        public DateTime Date { get; set; }
    }

    public class GetEmployeesWorkTempoRequest : Request
    {
        public int Year { get; set; }
    }

}
