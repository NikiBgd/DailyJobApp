﻿using MoreLinq;
using ReportCMSLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ReportCMSLibrary
{
    public static class ReportCMSUtility
    {
        public static void InsertNewReport (List<ColumnReport> report)
        {
            if (report != null)
            {
                var reportId = GetLastReportId() + 1;

                foreach (var column in report)
                {
                    var monthlyPeriod = 0;

                    var typeId = Convert.ToInt32(column.TypeID);

                    var columnName = column.ColumnName;

                    var ordering = Convert.ToInt32(column.Ordering);

                    var year = Convert.ToInt32(DateTime.Now.Year);

                    var isDateRelated = column.IsDateRelated;

                    if (isDateRelated)
                    {
                        monthlyPeriod = Convert.ToInt32(column.MonthlyPeriod);
                    }

                    var month = 0;

                    var dateValue = new DateTime(1753, 1, 1);

                    var textValue = "";

                    var boolValue = false;


                    using (var context = new DailyJobEntities())
                    {
                        var clientIdList = context.Customers.Select(x => x.CustomerID).ToList();
                        var reportData = context.Set<ReportData>();

                        if (clientIdList != null)
                        {
                            foreach (var clientId in clientIdList)
                            {
                                if (monthlyPeriod != 0)
                                {
                                    for (int i = monthlyPeriod; i <= 12; i = i + monthlyPeriod)
                                    {
                                        reportData.Add(new ReportData
                                        {
                                            ClientID = clientId,
                                            ReportID = reportId,
                                            TypeID = typeId,
                                            ColumnName = columnName,
                                            IsDateRelated = isDateRelated,
                                            MonthlyPeriod = monthlyPeriod,
                                            Ordering = ordering,
                                            Year = year,
                                            Month = i,
                                            DateValue = dateValue,
                                            TextValue = textValue,
                                            BoolValue = boolValue
                                        });

                                        context.SaveChanges();
                                    }
                                }
                                else
                                {
                                    reportData.Add(new ReportData
                                    {
                                        ClientID = clientId,
                                        ReportID = reportId,
                                        TypeID = typeId,
                                        ColumnName = columnName,
                                        IsDateRelated = isDateRelated,
                                        MonthlyPeriod = monthlyPeriod,
                                        Ordering = ordering,
                                        Year = year,
                                        Month = month,
                                        DateValue = dateValue,
                                        TextValue = textValue,
                                        BoolValue = boolValue
                                    });

                                    context.SaveChanges();
                                }
                            }
                        }
                    }
                }
            }
        }

        public static void HandleReportsForNewCustomer (int customerId)
        {
            using (var context = new DailyJobEntities())
            {
                var reportIds = context.ReportDatas.DistinctBy(x => x.ReportID).Select(x => x.ReportID).ToList();
                if (reportIds != null)
                {
                    foreach (var id in reportIds)
                    {
                        var reportData = context.ReportDatas.Where(x => x.ReportID == id).FirstOrDefault();
                        var year = reportData.Year;
                        var clientId = reportData.ClientID;

                        var uniqueReportData = context.ReportDatas.Where(x => x.ReportID == id && x.Year == year && x.ClientID == clientId).ToList();
                        var objectForInsert = PrepareReportShemaObject(uniqueReportData, customerId);

                        context.ReportDatas.AddRange(objectForInsert);
                        context.SaveChanges();
                    }
                }
            }
        }

        public static void DeleteReport (int reportId)
        {
            using (var context = new DailyJobEntities())
            {
                var report = context.ReportDatas.Where(x => x.ReportID == reportId).ToList();

                if (report != null)
                {
                    context.ReportDatas.RemoveRange(report);
                    context.SaveChanges();
                }
            }
        }

        public static List<ReportType> GetAllReports()
        {
            var reports = new List<ReportType>();

            using (var context = new DailyJobEntities())
            {
                reports = context.ReportTypes.ToList();
            }

            return reports;
        }


        private static List<ReportData> PrepareReportShemaObject (List<ReportData> reportData, int clientId)
        {
            var reportList = new List<ReportData>();

            if (reportData != null)
            {
                foreach (var report in reportData)
                {
                    var reportDataObject = new ReportData
                    {
                        ClientID = clientId,
                        ColumnName = report.ColumnName,
                        IsDateRelated = report.IsDateRelated,
                        Month = report.Month,
                        Ordering = report.Ordering,
                        MonthlyPeriod = report.MonthlyPeriod,
                        ReportDataType = report.ReportDataType,
                        ReportID = report.ReportID,
                        TypeID = report.TypeID,
                        Year = report.Year,
                        TextValue = "",
                        BoolValue = false,
                        DateValue = new DateTime (1753, 1, 1)
                    };

                    reportList.Add(reportDataObject);
                }
            }

            return reportList;
        }

        private static int GetLastReportId()
        {
            var maxReportId = 0;

            using (var context = new DailyJobEntities())
            {
                maxReportId = context.ReportDatas.Max(x => x.ReportID);
            }

            return maxReportId;
        }
    }
}
