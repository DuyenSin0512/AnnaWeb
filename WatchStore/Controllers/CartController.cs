using WatchStore.Library;
using WatchStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Collections;
using System.Xml.Linq;
using System.Data.Entity.Migrations;
using MoMo;
using Newtonsoft.Json.Linq;

namespace WatchStore.Controllers
{
    public class CartController : Controller
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(int pid, int qty)
        {

            // 
            var p = db.Products.First(m => m.Status == 1 && m.ID == pid);
            if (p.Quantity < qty)
            {
                return Json(new { result = 3 });
            }

            var cart = Session["Cart"];
            if (cart == null)
            {
                var item = new ModelCart();
                item.ProductID = p.ID;
                item.Name = p.Name;
                item.Slug = p.Slug;

                item.Image = p.Image;
                item.Quantity = qty;
                if (p.Discount == 3)
                {
                    item.Price = p.ProPrice;
                }
                else
                {
                    item.Price = p.Price;
                }
                var list = new List<ModelCart>();
                list.Add(item);

                Session["Cart"] = list;
                return Json(new { result = 1 });
            }
            else
            {
                var list = (List<ModelCart>)cart;

                if (list.Exists(m => m.ProductID == pid))
                {
                    foreach (var item in list)
                    {
                        if (item.ProductID == pid)
                            item.Quantity += qty;
                        return Json(new { result = 2 });
                    }
                }
                else
                {
                    var item = new ModelCart();
                    item.ProductID = p.ID;
                    item.Name = p.Name;
                    item.Slug = p.Slug;
                    item.Image = p.Image;
                    item.Quantity = qty;
                    if (p.Discount == 3)
                    {
                        item.Price = p.ProPrice;
                    }
                    else
                    {
                        item.Price = p.Price;
                    }
                    list.Add(item);
                    return Json(new { result = 1 });
                }
            }
            return Json(new { result = 0 });
        }

        public ActionResult Set(int pid, int qty)
        {

            // 
            var p = db.Products.First(m => m.Status == 1 && m.ID == pid);
            if (p.Quantity < qty)
            {
                return Json(new { result = 2 });
            }

            var cart = Session["Cart"];
            if (cart == null)
            {

            }
            else
            {
                var list = (List<ModelCart>)cart;

                if (list.Exists(m => m.ProductID == pid))
                {
                    list.Find(x => x.ProductID == pid).Quantity = qty;
                    Session["Cart"] = list;
                    return Json(new { result = 1 });
                }
            }
            return Json(new { result = 0 });
        }

        public JsonResult Update(int pid, String option)
        {
            var sCart = (List<ModelCart>)Session["Cart"];
            ModelCart c = sCart.First(m => m.ProductID == pid);
            if (c != null)
            {
                switch (option)
                {
                    case "add":
                        c.Quantity++;
                        return Json(1);
                    case "minus":
                        c.Quantity--;
                        return Json(2);
                    case "remove":
                        sCart.Remove(c);
                        if (sCart.Count() == 0)
                            Session.Remove("Cart");
                        return Json(3);
                    default:
                        break;
                }
            }
            return Json(null);
        }
        public ActionResult RemoveAll()
        {
            Session.Remove("Cart");
            Notification.set_flash("Đã xóa toàn bộ sản phẩm trong giỏ hàng!", "success");
            return Redirect("~/gio-hang");
        }
        public ActionResult RemoveOne(int pid, int qty)
        {
            var p = db.Products.First(m => m.Status == 1 && m.ID == pid);
            if (p.Quantity < qty)
            {
                return Json(new { result = 3 });
            }

            var cart = Session["Cart"];
            if (cart != null)
            {
                var result = ( (IEnumerable)cart ).Cast<ModelCart>().ToList();
                result = result.Where(x => x.ProductID != pid).ToList();

                Session["Cart"] = result;
                return Json(new { result = 1 });
            }
            return Json(new { result = 0 });
        }
        public ActionResult Checkout()
        {
            if (Session["User_Name"] != null && Session["Cart"] != null)
            {
                int user_id = Convert.ToInt32(Session["User_ID"]);
                ViewBag.Info = db.Users.Where(m => m.ID == user_id).First();
            }
            else
                return RedirectToAction("Index", "Cart");
            return View();
        }

        [HttpPost]
        public JsonResult Payment(String Email, String Address, String FullName, String Phone, int type)
        {
            var order = new MOrder();
            int user_id = Convert.ToInt32(Session["User_ID"]);
            order.Code = "thanh toan "+ DateTime.Now.ToString("yyyyMMddhhMMss"); // yyyy-MM-dd hh:MM:ss
            order.CustemerId = user_id;
            order.CreateDate = DateTime.Now;
            order.DeliveryAddress = Address;
            order.DeliveryEmail = Email;
            order.DeliveryPhone = Phone;
            order.DeliveryName = FullName;
            order.Status = 1;
            db.Orders.Add(order);
            db.SaveChanges();

            var OrderID = order.Id;

            foreach (var c in (List<ModelCart>)Session["Cart"])
            {
                var orderdetails = new MOrderdetail();
                orderdetails.OrderId = OrderID;
                orderdetails.ProductId = c.ProductID;
                orderdetails.Price = c.Price;
                orderdetails.Quantity = c.Quantity;
                orderdetails.Amount = c.Price * c.Quantity;
                db.Orderdetails.Add(orderdetails);
                var product = db.Products.Where(x => x.ID == c.ProductID).FirstOrDefault();
                product.Quantity = product.Quantity - c.Quantity;
                db.Products.AddOrUpdate(product);
            }
            db.SaveChanges();

            Session.Remove("Cart");
            Notification.set_flash("Bạn đã đặt hàng thành công!", "success");
            return Json(true);

        }

        public JsonResult Tesst()
        {
            if (Session["User_Name"] != null)
                return Json(1);
            return Json(0);
        }
        public JsonResult CheckAuth()
        {
            if (Session["User_Name"] != null)
                return Json(1);
            return Json(0);
        }

        public JsonResult PaymentMoMo(String Email, String Address, String FullName, String Phone)
        {
              //< option value = "1" > Chờ Xử Lý</ option >
              //              < option value = "2" > Đang xử lý</ option >
              //              < option value = "3" > Hoàn thành </ option >
            var cart = (List<ModelCart>)Session["Cart"];
            var price = cart.Sum(c => (c.Price * c.Quantity));
            //request params need to request to MoMo system
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMOOJOI20210710";
            string accessKey = "iPXneGmrJH0G8FOP";
            string serectkey = "sFcbSGRSJjwGxwhhcEktCHWYUuTuPNDB";
            string orderInfo = "Thanh toán hóa đơn";
            string returnUrl = $"https://localhost:44336/account/order";
            string notifyurl = "https://4c8d-2001-ee0-5045-50-58c1-b2ec-3123-740d.ap.ngrok.io/Home/SavePayment"; //lưu ý: notifyurl không được sử dụng localhost, có thể sử dụng ngrok để public localhost trong quá trình test

            string amount = price.ToString();
            string orderid = DateTime.Now.Ticks.ToString(); //mã đơn hàng
            string requestId = DateTime.Now.Ticks.ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyurl + "&extraData=" +
                extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);

            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }

            };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

            var order = new MOrder();
            int user_id = Convert.ToInt32(Session["User_ID"]);
            order.Code = "momo" + DateTime.Now.ToString("yyyyMMddhhMMss"); // yyyy-MM-dd hh:MM:ss
            order.CustemerId = user_id;
            order.CreateDate = DateTime.Now;
            order.DeliveryAddress = Address;
            order.DeliveryEmail = Email;
            order.DeliveryPhone = Phone;
            order.DeliveryName = FullName;
            order.Status = 1;
            db.Orders.Add(order);
            db.SaveChanges();

            var OrderID = order.Id;

            foreach (var c in (List<ModelCart>)Session["Cart"])
            {
                var orderdetails = new MOrderdetail();
                orderdetails.OrderId = OrderID;
                orderdetails.ProductId = c.ProductID;
                orderdetails.Price = c.Price;
                orderdetails.Quantity = c.Quantity;
                orderdetails.Amount = c.Price * c.Quantity;
                db.Orderdetails.Add(orderdetails);
                var product = db.Products.Where(x => x.ID == c.ProductID).FirstOrDefault();
                product.Quantity = product.Quantity - c.Quantity;
                db.Products.AddOrUpdate(product);
            }
            db.SaveChanges();

            JObject jmessage = JObject.Parse(responseFromMomo);
            var arr = jmessage.GetValue("payUrl").ToString();
            //return Redirect(arr);
            return Json(arr);
        }

    }
}