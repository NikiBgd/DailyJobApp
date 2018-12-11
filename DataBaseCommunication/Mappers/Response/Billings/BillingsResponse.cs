using DataBaseCommunication.DataBaseObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.Mappers.Response.Billings
{
    public class BillingsResponse : Response
    {
        public List<Billing> Billings { get; set; }
    }

    public class ClientWarningsResponse : Response
    {
        public List<ClientWarnings> ClientWarnings { get; set; }
    }

    public class InsertClientWarningResponse : Response
    {

    }
}
