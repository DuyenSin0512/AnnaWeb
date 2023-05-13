namespace WatchStore.Models
{
    using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;



    [Table("Posts")]
    public class MPost
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage ="Vui lòng nhập chủ đề")]
        public int Topid { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tiêu đề")]
        public string Title { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mô tả")]  
        public string Slug { get; set; }
        public string Detail { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập ảnh")]
        public string Img { get; set; }
        public string Type { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập từ khóa SEO")]
        public string MetaKey { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mô tả SEO")]
        public string MetaDesc { get; set; }
        public DateTime Created_At { get; set; }
        public int? Created_By { get; set; }
        public DateTime Updated_At { get; set; }
        public int? Updated_By { get; set; }
        public int Status { get; set; }
    }
}