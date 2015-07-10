using education.Mailers;
using education.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace education.Controllers
{
    public class ContactController : Controller
    {
        //
        // GET: /Contact/
        public ActionResult Index()
        {
            //var db = new educationEntities();
            //ViewBag.SubjectName = new SelectList(db.menus, "id", "title");
            var model = new ContactEmail();
            return View(model);
        }
        [HttpPost]
        public ActionResult Index(ContactEmail model)
        {
            //var db = new educationEntities();
            //ViewBag.SubjectName = new SelectList(db.menus, "id", "title");
            if (ModelState.IsValid)
            {
                try
                {
                    //var s = ViewData["MyItems"] as SelectList;
                    IUserMailer mailer = new UserMailer();
                    mailer.Welcome(model).Send();
                    ModelState.AddModelError("", "Thành công");
                }
                catch
                {
                    ModelState.AddModelError("", "Thất bại");
                }
            }
            return View(model);
        }
        public ActionResult DropDownList()
        {

            var db = new educationEntities();
            var query = db.menus.Select(c => new { c.id, c.title });
            ViewData["MyItems"] = new SelectList(query.AsEnumerable(), "id", "title");
            return PartialView();
        }
	}
}