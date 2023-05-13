using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchStore.Library
{
    public class ConstValue
    {

    }
    public class MailSetting
    {
        public const string Mail = "canikissyou869@gmail.com";
        public const string DisplayName = "Shop mat kinh";
        public const string Password = "gozeeqnxbtagedsi";
        public const string Host = "smtp.gmail.com";
        public const int Port = 587;

    }
    public enum RoleUser
    {
        NhanVien, //0
        KhachHang, //1
        Admin, //2
    }
    public enum product
    {
        news, //1
        nomal, //2
        old, //3
    }
}