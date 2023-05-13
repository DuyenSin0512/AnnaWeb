namespace WatchStore.Models
{
    using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;


    [Table("Users")]
    public class MUser
    {
        [Key]
        [Required(ErrorMessage ="vui lòng nhập Id")]
        public int ID { get; set; }
        [Required(ErrorMessage = "vui lòng nhập tên đầy đủ")]
        public string FullName { get; set; }
        [Required(ErrorMessage = "vui lòng nhập tên")]
        public string Name { get; set; }
        [Required(ErrorMessage = "vui lòng nhập mật khẩu")]
        public string Password { get; set; }
        [Required(ErrorMessage = "vui lòng nhập email")]
        public string Email { get; set; }
        [Required(ErrorMessage = "vui lòng nhập giới tính")]
        public int Gender { get; set; }//Giới tính
        [Required(ErrorMessage = "vui lòng nhập số điện thoại")]
        public int Phone { get; set; }
        [Required(ErrorMessage = "vui lòng nhập địa chỉ")]
        public string Address { get; set; }
        [Required(ErrorMessage = "vui lòng nhập ảnh")]
        public string Image { get; set; }
        [Required(ErrorMessage = "vui lòng nhập quyền truy cập")]
        public int Access { get; set; }
        public int Status { get; set; }
        public DateTime Created_at { get; set; }
        public int Created_by { get; set; }
        public DateTime Updated_at { get; set; }
        public int Updated_by { get; set; }

    }
    public class registerUser
    {
        public string Email { get; set; }
        public string Address { get; set; }
        public string FullName { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }//Giới tính
    }
}