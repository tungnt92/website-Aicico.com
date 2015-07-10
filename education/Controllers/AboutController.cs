using education.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace education.Controllers
{
    public class AboutController : Controller
    {
        educationEntities m = new educationEntities();
        // GET: About
        public ActionResult Index()
        {
            var contents = m.contents.Find(21);
            return View(contents);
        }
    }
}