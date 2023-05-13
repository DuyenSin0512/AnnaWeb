using WatchStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Threading.Tasks;
using WatchStore.Library;
using System.Net.Mail;
using MimeKit;
using MailKit.Security;
using System.Net;
using System.Web.Services.Description;
using System.Xml.Linq;
using System.Data.Entity.Migrations;

namespace WatchStore.Controllers
{
    public class AccountController : Controller
    {
        private WatchStoreDbContext db = new WatchStoreDbContext();
        //public AccountController()
        //{
        //    if (System.Web.HttpContext.Current.Session["User_Name"] == null)
        //    {
        //        System.Web.HttpContext.Current.Response.Redirect("~/");
        //    }
        //}

        [HttpPost]
        public JsonResult UserLogin(String User, String Password)
        {
            Password = MyString.ToMD5(Password);

            var count_username = db.Users.Where(m => m.Status == 1 && ( ( m.Phone ).ToString() == User || m.Email == User || m.Name == User ) && m.Password == Password).ToList();
            //var check = SendEmailAsync("hvhust1998@gmail.com", "ko co gi", "dmo1");
            if (count_username.Count == 0)
            {

                return Json(new { s = 1 });
            }
            else
            {
                var user = count_username.First();
                Session["User_Name"] = user.FullName;
                Session["User_ID"] = user.ID;
            }
            return Json(new { s = 0 });
        }

        public ActionResult UserLogout(String url)
        {
            Session["User_Name"] = null;
            Session["User_ID"] = null;
            return Redirect("~/" + url);
        }
        public ActionResult ProFile()
        {
            if (System.Web.HttpContext.Current.Session["User_Name"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/");
            }
            return View();
        }
        public ActionResult Notification()
        {
            if (System.Web.HttpContext.Current.Session["User_Name"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/");
            }
            return View();
        }
        public ActionResult Order()
        {
            if (System.Web.HttpContext.Current.Session["User_Name"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/");
            }
            int userid = Convert.ToInt32(Session["User_ID"]);
            var list = db.Orders.Where(m => m.CustemerId == userid).OrderByDescending(m => m.CreateDate).ToList();
            ViewBag.itemOrder = db.Orderdetails.ToList();
            int user_id = Convert.ToInt32(Session["User_ID"]);
            ViewBag.Info = db.Users.Where(m => m.ID == user_id).First();

            ViewBag.productOrder = db.Products.ToList();
            return View(list);
        }
        public ActionResult ActionOrder()
        {
            if (System.Web.HttpContext.Current.Session["User_Name"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/");
            }
            var list = db.Orders.ToList();
            ViewBag.Hoanthanh = db.Orders.Where(m => m.Status == 3).Count();
            ViewBag.ChoXuLy = db.Orders.Where(m => m.Status == 1).Count();
            ViewBag.DangXuLy = db.Orders.Where(m => m.Status == 2).Count();
            return View("_ActionOrder", list);
        }
        public ActionResult OrderDetails(int id)
        {
            if (System.Web.HttpContext.Current.Session["User_Name"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/");
            }
            int userid = Convert.ToInt32(Session["User_ID"]);
            var checkO = db.Orders.Where(m => m.CustemerId == userid && m.Id == id);
            if (checkO.Count() == 0)
            {
                return this.NotFound();
            }

            var id_order = db.Orders.Where(m => m.CustemerId == userid && m.Id == id).FirstOrDefault();
            ViewBag.Order = id_order;
            var itemOrder = db.Orderdetails.Where(m => m.OrderId == id_order.Id).ToList();
            ViewBag.productOrder = db.Products.ToList();
            return View(itemOrder);
        }
        public ActionResult NotFound()
        {
            if (System.Web.HttpContext.Current.Session["User_Name"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/");
            }
            return View();
        }
        [HttpPost]
        public JsonResult Register(registerUser inputData)
        {
            try
            {
                var phone = Convert.ToInt32(inputData.Phone);
                var checkPhone = db.Users.Any(m => m.Phone == phone);
                if (checkPhone)
                {
                    return Json(new { Code = 1, Message = "Số điện thoại đã được sử dụng." });
                }
                var checkEmail = db.Users.Any(m => m.Email.ToLower().Equals(inputData.Email.ToLower()));
                if (checkEmail)
                {
                    return Json(new { Code = 1, Message = "Email đã được sử dụng." });
                }
                var user = new MUser();
                user.Phone = phone;
                user.Email = inputData.Email;
                user.Address = inputData.Address;
                user.FullName = inputData.FullName;
                user.Name = inputData.Name;
                user.Gender = 1;
                user.Image = "";
                user.Access = 1;
                user.Status = 1;
                user.Password = MyString.ToMD5(inputData.Password);
                user.Created_at = DateTime.Now;
                user.Created_by = 1;
                user.Updated_at = DateTime.Now;
                user.Updated_by = 1;

                db.Users.Add(user);
                db.SaveChanges();
                //Session["User_Name"] = user.FullName;
                //Session["User_ID"] = user.ID;
                return Json(new { Code = 0, Message = "Đăng ký thành công!" });
            }
            catch (Exception e)
            {
                return Json(new { Code = 1, Message = "Đăng ký thất bại!" });
                throw e;
            }
        }
        public JsonResult ForgotPassWord(string email)
        {
            try
            {
                var checkPM = db.Users.Where(m => m.Email.ToLower().Equals(email.ToLower())).FirstOrDefault();
                if (checkPM == null)
                {
                    return Json(new { Code = 1, Message = "Email chưa được đăng ký." });
                }

                checkPM.Password = MyString.ToMD5("Anna2023");
                SendEmailAsync(email,"Cấp mật khẩu", "Mật khẩu mới của bạn là : Anna2023");

                db.Users.AddOrUpdate(checkPM);
                db.SaveChanges();

                return Json(new { Code = 0, Message = "Cập nhật thành công!" });
            }
            catch (Exception e)
            {
                return Json(new { Code = 1, Message = "Thất bại!" });
                throw e;
            }
        }

        public bool SendEmailAsync(string receiver, string subject, string message)
        {
            if (ModelState.IsValid)
            {
                var senderEmail = new MailAddress(MailSetting.Mail, MailSetting.DisplayName);
                var receiverEmail = new MailAddress(receiver, "Receiver");
                var password = MailSetting.Password;
                var sub = subject;
                var body = message;
                var smtp = new SmtpClient
                {
                    Host = MailSetting.Host,
                    Port = MailSetting.Port,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(senderEmail.Address, password)
                };
                using (var mess = new MailMessage(senderEmail, receiverEmail)
                {
                    Subject = subject,
                    Body = body
                })
                {
                    smtp.Send(mess);
                    return true;
                }
            }
            return false;
        }
    }
}