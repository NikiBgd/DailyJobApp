using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataBaseCommunication.Services.Clients;
using DailyJobStarterPack.DataBaseObjects;
using DataBaseCommunication.Services.Offer;

namespace DataBaseCommunication.Helpers
{
    public class OffersHelper
    {
        public static string GetOfferStatus(int status)
        {
            string statusString = "";
            switch (status)
            {
                case 0:
                    statusString = "Kreiran";
                    break;
                case 1:
                    statusString = "Prihvaćen";
                    break;
                case 2:
                    statusString = "Odbijen";
                    break;
                case 3:
                    statusString = "Razmišlja";
                    break;
                default:
                    break;
            }

            return statusString;
        }

        public static string GetMakeRentType(bool showString, string rentType)
        {
            string rentTypeString = "";
            if (showString)
            {
                switch (rentType)
                {
                    case "1":
                        rentTypeString = "Za fizicko lice";
                        break;
                    case "2":
                        rentTypeString = "Za pravna lica";
                        break;
                    default:
                        break;
                }
            }
            return rentTypeString;
        }


        public static List<Offer> ApplyOffersSearchCriteria(OffersSearchCriteria criteria, List<Offer> list)
        {
            DateTime date = DateTime.Now;
            var firstDayOfMonth = new DateTime(date.Year, date.Month, 1);
            var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

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

            return list;
        }
    }
}
