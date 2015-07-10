using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using education.Models;

namespace education.Controllers
{
    public class ServicesController : Controller
    {
        private educationEntities db = new educationEntities();

        // GET: /Services/
        public ActionResult Index()
        {
            return View(db.contents.Where(c => c.catid ==3).ToList());
        }
        [Authorize]
        public ActionResult ListService()
        {
            return View(db.contents.Where(c => c.catid == 3).ToList());
        }
        [HttpPost, Authorize]
        public JsonResult DeleteService(int id)
        {
            content content = db.contents.Find(id);
            db.contents.Remove(content);
            db.SaveChanges();
            return Json("Xóa serive thành công!");
        }
        // GET: /Services/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            content content = db.contents.Find(id);
            if (content == null)
            {
                return HttpNotFound();
            }
            return View(content);
        }

        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Services/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost,Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "title,image,introtext,fulltext")] content content)
        {
            if (ModelState.IsValid)
            {
                string CurrentUser = null;
                if (System.Web.HttpContext.Current.Request.IsAuthenticated)
                {
                    CurrentUser = System.Web.HttpContext.Current.User.Identity.Name;
                }
                content.create_by = CurrentUser;
                content.catid = 3;
                db.contents.Add(content);
                db.SaveChanges();
                return RedirectToAction("ListService");
            }

            return View(content);
        }

        // GET: /Services/Edit/5
        [Authorize]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            content content = db.contents.Find(id);
            if (content == null)
            {
                return HttpNotFound();
            }
            return View(content);
        }

        // POST: /Services/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost,Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,title,image,introtext,fulltext")] content content)
        {
            if (ModelState.IsValid)
            {
                string CurrentUser = null;
                if (System.Web.HttpContext.Current.Request.IsAuthenticated)
                {
                    CurrentUser = System.Web.HttpContext.Current.User.Identity.Name;
                }
                content.create_by = CurrentUser;
                content.catid = 3;
                db.Entry(content).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ListService");
            }
            return View(content);
        }

        // GET: /Services/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            content content = db.contents.Find(id);
            if (content == null)
            {
                return HttpNotFound();
            }
            return View(content);
        }

        // POST: /Services/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            content content = db.contents.Find(id);
            db.contents.Remove(content);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult TopContent()
        {

            return PartialView(db.contents.Find(18));
        }
        public ActionResult LeftContent()
        {

            return PartialView(db.contents.Find(19));
        }
        public ActionResult RightContent()
        {

            return PartialView(db.contents.Find(20));
        }
    }
}
