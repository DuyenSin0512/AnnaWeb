namespace WatchStore.Models
{
    using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

    [Table("Categorys")]
    public class MCategory      
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tên loại sản phẩm")]
        public string Name { get; set; }
        public string Slug { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập chủ đề cha")]
        public int? ParentId { get; set; }
        [Required]
        public int? Orders { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập chủ để SEO")]

        public string Metakey { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập mô tả")]

        public string Metadesc { get; set; }
        public DateTime? Created_at { get; set; }

        public int? Created_by { get; set; }

        public DateTime? Updated_at { get; set; }

        public int? Updated_by { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập trạng thái")]
        public int? Status { get; set; }
    }
}