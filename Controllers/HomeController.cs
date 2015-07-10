using education.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace education.Controllers
{
    public class HomeController : Controller
    {
        educationEntities m = new educationEntities();
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            
            return PartialView(m.menus.OrderBy(s => s.ordering));
        }
        [ChildActionOnly]
        public ActionResult Slider()
        {

            return PartialView(m.mediagalleries);
        }
        [ChildActionOnly]
        public ActionResult Top8News()
        {
            return PartialView(from c in m.categories
                               from x in m.contents
                               where c.parent_id == 2 && x.catid == c.id
                               select x);
        }
        [ChildActionOnly]
        public ActionResult Slogan()
        {

            return PartialView(m.contents.Find(13));
        }
        public ActionResult HomeServices()
        {

            return PartialView(m.contents.Where(db => db.catid == 3).OrderBy(db => db.ordering));
        }
    }
}