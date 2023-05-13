using WatchStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace WatchStore.Controllers
{
    public class TrackOrderController : Controller
    {

        private WatchStoreDbContext db = new WatchStoreDbContext();
        // GET: TrackOrder
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection fc)
        {
            string phoneNumber = fc["phone"].ToString();
            var listOrder = db.Orders.Where(m => m.DeliveryPhone.Equals(phoneNumber)).OrderByDescending(m => m.Id).ToList();
            return View("listOrders", listOrder);
        }
        public ActionResult DetailOrder(int id)
        {
            var listOrder = db.Orders.Find(id);
            return View("DetailOrder", listOrder);
        }
        public ActionResult productDetailCheckOut(int orderId)
        {
            var list = db.Orderdetails.Where(m => m.OrderId == orderId).ToList();
            return View("_productDetailCheckOut", list);

        }
        public ActionResult subnameProduct(int id)
        {
            var list = db.Products.Find(id);
            return View("_subproductOrdersuccess", list);

        }
    }
}