using DailyJobStarterPack.DataBaseObjects;
using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.DataProviders.Base;
using DataBaseCommunication.Mappers.Requests.Billings;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.DataProviders
{
    public class BillingsProvider : Provider
    {
        public List<Billing> GetBillingsByYear(BillingsRequest request)
        {
            var ret = new List<Billing>();
            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.GetBillingsByYear", conn);

            AddInParameter(commandWrapper, "@Year", DbType.Int32, request.Year);

            IDataReader reader = null;
            try
            {
                conn.Open();

                using (SqlDataReader rdr = commandWrapper.ExecuteReader())
                {
                    // iterate through results, printing each to console
                    while (rdr.Read())
                    {
                        Billing billing = new Billing();
                        billing.Id = Convert.ToInt64(rdr["ID"]);
                        billing.ClientId = Convert.ToInt64(rdr["ClientID"]);
                        billing.Paid = Convert.ToBoolean(rdr["PAID"]);
                        billing.FirstWarning = Convert.ToBoolean(rdr["FirstWarning"]);
                        billing.SecondWarning = Convert.ToBoolean(rdr["SecondWarning"]);
                        billing.Year = Convert.ToInt32(rdr["Year"]);
                        billing.Month = Convert.ToInt32(rdr["Month"]);

                        ret.Add(billing);
                    }
                }

                return ret;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }

        public bool InsertBilling(Billing billing)
        {
            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.InsertBilling", conn);

            AddInParameter(commandWrapper, "@ClientID", DbType.Int32, billing.ClientId);
            AddInParameter(commandWrapper, "@Paid", DbType.Boolean, billing.Paid);
            AddInParameter(commandWrapper, "@FirstWarning", DbType.Boolean, billing.FirstWarning);
            AddInParameter(commandWrapper, "@SecondWarning", DbType.Boolean, billing.SecondWarning);
            AddInParameter(commandWrapper, "@Year", DbType.Int32, billing.Year);
            AddInParameter(commandWrapper, "@Month", DbType.Int32, billing.Month);

            IDataReader reader = null;
        
            try
            {
                conn.Open();
                reader = commandWrapper.ExecuteReader();
                //FillChanges(reader, tmp, 0, int.MaxValue);
                //MakeDboLog(request.ToString(), reader.ToString(), "dbo.Get_All_Changes");

                return true;
            }
            catch (Exception ex)
            {
                var test = "testt";
                return false;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }


        public bool UpdateBilling(Billing billing)
        {
            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.UpdateBilling", conn);

            AddInParameter(commandWrapper, "@ClientID", DbType.Int32, billing.ClientId);
            AddInParameter(commandWrapper, "@Paid", DbType.Boolean, billing.Paid);
            AddInParameter(commandWrapper, "@FirstWarning", DbType.Boolean, billing.FirstWarning);
            AddInParameter(commandWrapper, "@SecondWarning", DbType.Boolean, billing.SecondWarning);
            AddInParameter(commandWrapper, "@Year", DbType.Int32, billing.Year);
            AddInParameter(commandWrapper, "@Month", DbType.Int32, billing.Month);

            IDataReader reader = null;

            try
            {
                conn.Open();
                reader = commandWrapper.ExecuteReader();
                //FillChanges(reader, tmp, 0, int.MaxValue);
                //MakeDboLog(request.ToString(), reader.ToString(), "dbo.Get_All_Changes");

                return true;
            }
            catch (Exception ex)
            {
                var test = "testt";
                return false;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }


        public Billing GetBilling(long clientId,int year,int month)
        {
            Billing billing = null;
            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.GetBilling", conn);

            AddInParameter(commandWrapper, "@ClientID", DbType.Int32, clientId);
            AddInParameter(commandWrapper, "@Year", DbType.Int32, year);
            AddInParameter(commandWrapper, "@Month", DbType.Int32, month);

            IDataReader reader = null;
            try
            {
                conn.Open();

                using (SqlDataReader rdr = commandWrapper.ExecuteReader())
                {
                    // iterate through results, printing each to console
                    while (rdr.Read())
                    {
                        billing = new Billing();
                        billing.Id = Convert.ToInt64(rdr["ID"]);
                        billing.ClientId = Convert.ToInt64(rdr["ClientID"]);
                        billing.Paid = Convert.ToBoolean(rdr["PAID"]);
                        billing.FirstWarning = Convert.ToBoolean(rdr["FirstWarning"]);
                        billing.SecondWarning = Convert.ToBoolean(rdr["SecondWarning"]);
                        billing.Year = Convert.ToInt32(rdr["Year"]);
                        billing.Month = Convert.ToInt32(rdr["Month"]);
                    }
                }

                return billing;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }


        public List<ClientWarnings> GetClientWarningsById(GetClientWarningsRequest request)
        {
            var ret = new List<ClientWarnings>();
            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.GetWarningsByClientID", conn);

            AddInParameter(commandWrapper, "@ClientID", DbType.Int32, request.ClientId);

            IDataReader reader = null;
            List<DataBaseChange> tmp = new List<DataBaseChange>();
            try
            {
                conn.Open();

                using (SqlDataReader rdr = commandWrapper.ExecuteReader())
                {
                    // iterate through results, printing each to console
                    while (rdr.Read())
                    {
                        ClientWarnings rd = new ClientWarnings();
                        rd.ID = Convert.ToInt32(rdr["ID"]);
                        rd.ClientID = Convert.ToInt32(rdr["ClientID"]);
                        rd.WarningDate = Convert.ToDateTime(rdr["WarningDate"]);
                        rd.WarningType = Convert.ToInt32(rdr["WarningType"]);

                        ret.Add(rd);
                    }
                }

                return ret;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }

        public bool InsertClientWarning(InsertClientWarningRequest request)
        {
            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.InsertClientWarning", conn);

            AddInParameter(commandWrapper, "@ClientID", DbType.Int32, request.ClientId);
            AddInParameter(commandWrapper, "@WarningDate", DbType.DateTime, request.WarningDate);
            AddInParameter(commandWrapper, "@WarningType", DbType.Int32, request.WarningType);

            IDataReader reader = null;
            List<DataBaseChange> tmp = new List<DataBaseChange>();
            try
            {
                conn.Open();
                reader = commandWrapper.ExecuteReader();
                //FillChanges(reader, tmp, 0, int.MaxValue);
                //MakeDboLog(request.ToString(), reader.ToString(), "dbo.Get_All_Changes");

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }



    }
}
