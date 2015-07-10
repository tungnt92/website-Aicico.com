using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace education.Models
{
    public class ContactEmail
    {
        [Display(Name = "Name", Prompt = "Enter your name....")]
        [Required(ErrorMessage = "*")]
        public string Name { get; set; }
        [Display(Name = "Email", Prompt = "Enter your email....")]
        [Required(ErrorMessage = "*")]
        [DataType(DataType.EmailAddress, ErrorMessage = "ádasdsa")]
        public string Email { get; set; }
        [Display(Name = "Address", Prompt = "Enter your address....")]
        [Required(ErrorMessage = "*")]
        public string Address { get; set; }
        [Display(Name = "Subject", Prompt = "Enter your subject....")]
        [Required(ErrorMessage = "*")]
        public string Subject { get; set; }
        [Display(Name = "Message", Prompt = "Enter your message....")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "*")]
        public string Message { get; set; }
    }
}