using education.Models;
using Mvc.Mailer;

namespace education.Mailers
{ 
    public interface IUserMailer
    {
        MvcMailMessage Welcome(ContactEmail email);
	}
}