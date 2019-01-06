using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataBaseCommunication.Services.Clients;
using DailyJobStarterPack.DataBaseObjects;

namespace DataBaseCommunication.Helpers
{
    public class CreationsHelper
    {
        public static List<Creation> ApplyCreationsSearchCriteria(CreationsSearchCriteria criteria, List<Creation> list)
        {
            DateTime date = DateTime.Now;
            var firstDayOfMonth = new DateTime(date.Year, date.Month, 1);
            var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

            if (!string.IsNullOrEmpty(criteria.Name))
            {
                list = list.Where(x => x.Name.ToLower().Replace("š", "s").Replace("č", "c").Replace("ć", "c").Replace("đ", "dj")
                    .Replace("ž", "z").Contains(criteria.Name.ToLower().Replace("š", "s").Replace("č", "c").Replace("ć", "c").Replace("đ", "dj")
                    .Replace("ž", "z"))).ToList();
            }

            if (criteria.DateFrom != null && criteria.DateFrom != DateTime.MinValue)
            {
                list = list.Where(x => x.CreationDate > criteria.DateFrom).ToList();
            }
            else
            {
                list = list.Where(x => x.CreationDate > firstDayOfMonth).ToList();
                criteria.DateFrom = firstDayOfMonth;
            }

            if (criteria.DateTo != null && criteria.DateTo != DateTime.MinValue)
            {
                list = list.Where(x => x.CreationDate < criteria.DateTo).ToList();
            }
            else
            {
                list = list.Where(x => x.CreationDate < lastDayOfMonth).ToList();
                criteria.DateTo = lastDayOfMonth;
            }

            if (criteria.IsPaid != null)
            {
                list = list.Where(x => x.IsPaid == criteria.IsPaid).ToList();
            }

            if (criteria.IsCompleted != null)
            {
                list = list.Where(x => x.IsDone == criteria.IsCompleted).ToList();
            }

            if (criteria.ClientType != null)
            {
                list = list.Where(x => x.ClientType == (ClientType)criteria.ClientType).ToList();
            }

            if (criteria.IsCompleted != null)
            {
                list = list.Where(x => x.IsAnswerSuccesful == criteria.IsConfirmed).ToList();
            }

            //TODO: DELETE IS JUST FLAGED!
            //if (criteria.IsCanceled != null)
            //{
            //   list = list.Where(x => x.IsDone == criteria.IsConfirmed).ToList();
            //}

            return list;
        }


    }
}
