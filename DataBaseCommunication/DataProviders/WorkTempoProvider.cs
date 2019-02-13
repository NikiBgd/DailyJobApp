using DailyJobStarterPack.DataBaseObjects;
using DataBaseCommunication.DataBaseObjects;
using DataBaseCommunication.DataProviders.Base;
using DataBaseCommunication.Mappers.Requests.WorkTempo;
using DataBaseCommunication.Mappers.Response.WorkTempo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseCommunication.DataProviders
{
    public class WorkTempoProvider : Provider
    {
        public List<EmployeeWorkTempo> GetWorkTempoByEmpoloyeeId (GetWorkTempoByEmpoloyeeIdRequest request)
        {
            var tempoList = new List<EmployeeWorkTempo>();

            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);

            var commandWrapper = GetStoredProcCommand("dbo.GetWorkTempoByEmployeeId", conn);

            AddInParameter(commandWrapper, "@EmployeeID", DbType.Int32, request.EmployeeId);
            AddInParameter(commandWrapper, "@Month", DbType.Int32, request.Month);
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
                        var workTempo = new EmployeeWorkTempo();
                        workTempo.EmployeeId = Convert.ToInt32(rdr["EmployeeID"]);
                        workTempo.Date = Convert.ToDateTime(rdr["Date"]);
                        workTempo.Status = Convert.ToInt32(rdr["StatusID"]);

                        tempoList.Add(workTempo);
                    }
                }

                return tempoList;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }

        public EmployeeWorkTempo UpdateEmpolyeeWorkTempo(UpdateEmployeeWorkTempoRequest request)
        {
            var workTempo = GetWorkTempoByEmployeeIdAndDate(request);

            if(workTempo != null)
            {
                UpdateWorkTempo(request);
            }
            else
            {
                workTempo = InsertWorkTempo(request);
            }

            return workTempo;
        }

        public List<EmployeeWorkTempo> GetEmployeesWorkTempo(GetEmployeesWorkTempoRequest request)
        {
            var tempoList = new List<EmployeeWorkTempo>();

            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);

            var commandWrapper = GetStoredProcCommand("dbo.GetEmployeesWorkTempo", conn);

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
                        var workTempo = new EmployeeWorkTempo
                        {
                            EmployeeId = Convert.ToInt32(rdr["EmployeeID"]),
                            Date = Convert.ToDateTime(rdr["Date"]),
                            Status = Convert.ToInt32(rdr["StatusID"])
                        };

                        tempoList.Add(workTempo);
                    }
                }

                return tempoList;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }

        public List<WorkTempoStatus> GetAllWorkTempoStatuses()
        {
            var tempoStatuses = new List<WorkTempoStatus>();

            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);

            var commandWrapper = GetStoredProcCommand("dbo.GetAllWorkTempoStatuses", conn);

            IDataReader reader = null;
            try
            {
                conn.Open();

                using (SqlDataReader rdr = commandWrapper.ExecuteReader())
                {
                    // iterate through results, printing each to console
                    while (rdr.Read())
                    {
                        var tempoStatus = new WorkTempoStatus
                        {
                            Id = Convert.ToInt32(rdr["ID"]),
                            StatusName = Convert.ToString(rdr["StatusName"])
                        };

                        tempoStatuses.Add(tempoStatus);
                    }
                }

                return tempoStatuses;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }

        }

        public List<UserProfile> GetAllUsers()
        {
            var users = new List<UserProfile>();

            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);

            var commandWrapper = GetStoredProcCommand("dbo.GetAllEmployees", conn);

            IDataReader reader = null;
            try
            {
                conn.Open();

                using (SqlDataReader rdr = commandWrapper.ExecuteReader())
                {
                    // iterate through results, printing each to console
                    while (rdr.Read())
                    {
                        var user = new UserProfile
                        {
                            FirstName = Convert.ToString(rdr["FirstName"]),
                            LastName = Convert.ToString(rdr["LastName"]),
                            Id = Convert.ToInt32(rdr["Id"])
                        };

                        users.Add(user);
                    }
                }

                return users;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }

        }

        private EmployeeWorkTempo GetWorkTempoByEmployeeIdAndDate(UpdateEmployeeWorkTempoRequest request)
        {
            EmployeeWorkTempo workTempo = null;

            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);

            var commandWrapper = GetStoredProcCommand("dbo.GetWorkTempoByEmployeeIdAndDate", conn);

            AddInParameter(commandWrapper, "@EmployeeID", DbType.Int32, request.EmployeeId);
            AddInParameter(commandWrapper, "@Date", DbType.Date, request.Date);

            IDataReader reader = null;
            try
            {
                conn.Open();

                using (SqlDataReader rdr = commandWrapper.ExecuteReader())
                {
                    // iterate through results, printing each to console
                    while (rdr.Read())
                    {
                        workTempo = new EmployeeWorkTempo
                        {
                            EmployeeId = Convert.ToInt32(rdr["EmployeeID"]),
                            Date = Convert.ToDateTime(rdr["Date"]),
                            Status = Convert.ToInt32(rdr["StatusID"])
                        };
                        break;
                    }
                }

                return workTempo;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }


        private EmployeeWorkTempo InsertWorkTempo(UpdateEmployeeWorkTempoRequest request)
        {
            var workTempo = new EmployeeWorkTempo
            {
                EmployeeId = request.EmployeeId,
                Status = request.Status,
                Date = request.Date
            };

            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.InsertWorkTempo", conn);

            AddInParameter(commandWrapper, "@EmployeeID", DbType.Int32, request.EmployeeId);
            AddInParameter(commandWrapper, "@Date", DbType.Date, request.Date);
            AddInParameter(commandWrapper, "@StatusID", DbType.Int32, request.Status);

            IDataReader reader = null;

            try
            {
                conn.Open();
                reader = commandWrapper.ExecuteReader();
                //FillChanges(reader, tmp, 0, int.MaxValue);
                //MakeDboLog(request.ToString(), reader.ToString(), "dbo.Get_All_Changes");

                return workTempo;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
                commandWrapper.Dispose();
                conn.Close();
            }
        }


        private EmployeeWorkTempo UpdateWorkTempo(UpdateEmployeeWorkTempoRequest request)
        {
            var workTempo = new EmployeeWorkTempo
            {
                EmployeeId = request.EmployeeId,
                Status = request.Status,
                Date = request.Date
            };

            var conn = GetConnection(ConnectionNames.CSPSqlDatabase);
            var commandWrapper = GetStoredProcCommand("dbo.UpdateWorkTempo", conn);

            AddInParameter(commandWrapper, "@EmployeeID", DbType.Int32, request.EmployeeId);
            AddInParameter(commandWrapper, "@Date", DbType.Date, request.Date);
            AddInParameter(commandWrapper, "@StatusID", DbType.Int32, request.Status);

            IDataReader reader = null;

            try
            {
                conn.Open();
                reader = commandWrapper.ExecuteReader();
                //FillChanges(reader, tmp, 0, int.MaxValue);
                //MakeDboLog(request.ToString(), reader.ToString(), "dbo.Get_All_Changes");

                return workTempo;
            }
            catch (Exception ex)
            {
                return null;
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
