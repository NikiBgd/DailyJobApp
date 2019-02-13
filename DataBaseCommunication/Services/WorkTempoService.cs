using DataBaseCommunication.DataProviders;
using DataBaseCommunication.Mappers.Requests.WorkTempo;
using DataBaseCommunication.Mappers.Response.WorkTempo;
using DataBaseCommunication.Models;
using DataBaseCommunication.Services.Interface;
using MoreLinq;
using System.Collections.Generic;
using System.Linq;

namespace DataBaseCommunication.Services
{
    public class WorkTempoService : IWorkTempoService
    {
        public WorkTempoResponse GetWorkTempoByEmpoloyeeId(GetWorkTempoByEmpoloyeeIdRequest request)
        {
            var workTempoProvider = new WorkTempoProvider();

            var workTempos = workTempoProvider.GetWorkTempoByEmpoloyeeId(request);

            var response = new WorkTempoResponse
            {
                EmployeeWorkTempo = workTempos
            };

            return response;
        }

        public UpdateEmpolyeeWorkTempoResponse UpdateEmployeeWorkTempo(UpdateEmployeeWorkTempoRequest request)
        {
            var workTempoProvider = new WorkTempoProvider();

            var workTempos = workTempoProvider.UpdateEmpolyeeWorkTempo(request);

            var response = new UpdateEmpolyeeWorkTempoResponse
            {
                EmployeeWorkTempo = workTempos
            };

            return response;
        }

        public GetEmployeesWorkTempoResponse GetEmployeesWorkTempo(GetEmployeesWorkTempoRequest request)
        {
            var workTempoProvider = new WorkTempoProvider();

            var workTempos = workTempoProvider.GetEmployeesWorkTempo(request);
            var tempoStatuses = workTempoProvider.GetAllWorkTempoStatuses();
            var employees = workTempoProvider.GetAllUsers();

            var EmployeesTempoStats = new List<GetEmployeesWorkTempoViewModel>();

            if(employees != null)
            {
                foreach (var employee in employees)
                {
                    var employeeStats = new GetEmployeesWorkTempoViewModel
                    {
                        Employee = employee 
                    };

                    var monthlyStats = new List<MonthlyStats>();

                    var employeeTempos = workTempos.Where(x => x.EmployeeId == employee.Id).ToList();
                    var distinctByMonth = employeeTempos.DistinctBy(x => x.Date.Month).Select(x => x.Date.Month).ToList();

                    if (distinctByMonth != null)
                    {
                        foreach (var month in distinctByMonth)
                        {
                            var monthStats = new MonthlyStats
                            {
                                Month = month
                            };

                            var monthlyTempo = new Dictionary<int, int>();
                            var monthlyList = employeeTempos.Where(x => x.Date.Month == month).ToList();

                            if(monthlyList != null)
                            {
                                foreach (var workEvent in monthlyList)
                                {
                                    if (monthlyTempo.ContainsKey(workEvent.Status))
                                    {
                                        var statusCount = monthlyTempo[workEvent.Status] + 1;
                                        monthlyTempo[workEvent.Status] = statusCount;
                                    }
                                    else
                                    {
                                        monthlyTempo.Add(workEvent.Status, 1);
                                    }
                                }
                            }

                            monthStats.Statuses = monthlyTempo;
                            monthlyStats.Add(monthStats);
                        }
                        employeeStats.MonthlyStats = monthlyStats;
                        EmployeesTempoStats.Add(employeeStats);
                    }
                }
            }


            var employeeListBinding = new List<GetEmployeeWorkTempoBinding>();
            //OVDE GA PAKUJEMO PRSKALICA VALJDA NECE PUCI PEGLANJE 
            foreach (var employee in EmployeesTempoStats)
            {
                var employeeTempo = new GetEmployeeWorkTempoBinding
                {
                    Employee = employee.Employee
                };

                var employeeMonthlyStats = new List<MonthlyStatsBinding>();

                foreach (var monthlyStat in employee.MonthlyStats)
                {
                    var monthlyStats = new MonthlyStatsBinding
                    {
                        Month = monthlyStat.Month
                    };

                    var formattedMonthlyStats = new List<FormattedMonthlyStats>();

                    foreach (var item in monthlyStat.Statuses)
                    {
                        var data = new FormattedMonthlyStats
                        {
                            StatusId = item.Key,
                            StatusCount = item.Value
                        };

                        formattedMonthlyStats.Add(data);
                    }
                    monthlyStats.Statuses = formattedMonthlyStats;
                    employeeMonthlyStats.Add(monthlyStats);
                }

                employeeTempo.MonthlyStats = employeeMonthlyStats;
                employeeListBinding.Add(employeeTempo);
            }

            var response = new GetEmployeesWorkTempoResponse
            {
                EmployeeWorkTempo = employeeListBinding,
                WorkTempoStatus = tempoStatuses
            };

            return response;
        }
    }
}
