using WatchStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace WatchStore.Areas.Admin.Controllers
{
    public class DashboardController : BaseController
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        // GET: Admin/Dashboard
      
        public ActionResult Index()
        {
            var results = (from od in db.Orderdetails
                           join o in db.Orders on od.OrderId equals o.Id
                           where (o.Trash != 1) && (o.Status ==1)

                           group od by new { od.OrderId, o } into groupb
                           orderby groupb.Key.o.CreateDate descending
                           select new ListOrder
                           {
                               ID = groupb.Key.OrderId,
                               SAmount = groupb.Sum(m => m.Amount),
                               CustomerName = groupb.Key.o.DeliveryName,
                               Status = groupb.Key.o.Status,
                               CreateDate = groupb.Key.o.CreateDate,
                               ExportDate = groupb.Key.o.ExportDate,


                           });

            ViewBag.CountOrderSuccess = db.Orders.Where(m => m.Status == 3).Count();
            // chi lay ra cac order ma co order detail (don hang co gia tri.)
            ViewBag.CountOrderCancel = results.ToList().Count();

            ViewBag.CountContactDoneReply = db.Contacts.Where(m => m.Flag == 0).Count();
            ViewBag.CountUser = db.Users.Where(m => m.Status != 0 && m.Access!=2).Count();
            
            ViewBag.Category = db.Categorys.Where(m => m.Status != 0).Count();
            ViewBag.Product = db.Products.Where(m => m.Status != 0).Count();
            ViewBag.Topic = db.Topics.Where(m => m.Status != 0).Count();
            ViewBag.Post = db.Posts.Where(m => m.Status != 0 && m.Type== "page").Count();
            var thisMonth = DateTime.Now.Month;
            var thisYear = DateTime.Now.Year;
            ViewBag.ThisMonth = thisMonth;
            ViewBag.ThisYear = thisYear;

            ViewBag.countOrderSuccessThisMouth = 
                db.Orders.Where(m => m.Status == 3 && m.CreateDate.Month == thisMonth && m.CreateDate.Year == thisYear).Count();
            ViewBag.countOrderCancelThisMouth =
                db.Orders.Where(m => m.Trash == 1 && m.CreateDate.Month == thisMonth && m.CreateDate.Year == thisYear).Count();
            ViewBag.countOrderWaitingThisMouth =
                db.Orders.Where(m => m.Status == 1 && m.Trash != 1 && m.CreateDate.Month == thisMonth && m.CreateDate.Year == thisYear).Count();
            ViewBag.countOrderSendingThisMouth =
                db.Orders.Where(m => m.Status == 2 && m.Trash != 1 && m.CreateDate.Month == thisMonth && m.CreateDate.Year == thisYear).Count();

            

            List<Double> list = new List<Double>();
            for(int i = 1; i <= 12; i++)
            {
                var odersInDay =db.Orders.Where(m => m.Status == 3 && m.CreateDate.Month == i && m.CreateDate.Year == thisYear).ToList();
                Double sum = 0;
                foreach(var order in odersInDay)
                {
                    sum += db.Orderdetails.Where(m => m.OrderId == order.Id).Sum(m => m.Price * m.Quantity);
                }
                list.Add(sum);
            }
            ViewBag.dataBarChar = list;

            return View();
        }
    }
}