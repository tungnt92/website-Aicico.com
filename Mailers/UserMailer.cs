using education.Models;
using Mvc.Mailer;

namespace education.Mailers
{ 
    public class UserMailer : MailerBase, IUserMailer 	
	{
		public UserMailer()
		{
			MasterName="_Layout";
		}
		
		public virtual MvcMailMessage Welcome(ContactEmail email)
		{
			//ViewBag.Data = someObject;
			/*return Populate(x =>
			{
				x.Subject = "Welcome";
				x.ViewName = "Welcome";
				x.To.Add("some-email@example.com");
			});*/
            var mailMessage = new MvcMailMessage { Subject = email.Subject };
            mailMessage.To.Add(email.Email);
            ViewBag.Name = email.Name;
            ViewBag.Address = email.Address;
            ViewBag.Message = email.Message;
            PopulateBody(mailMessage, viewName: "Welcome");
            return mailMessage;
		}
 	}
}