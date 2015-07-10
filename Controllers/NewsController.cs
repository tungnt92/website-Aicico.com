using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using education.Models;
using PagedList;

namespace education.Controllers
{
    public class NewsController : Controller
    {
        private educationEntities db = new educationEntities();

        // GET: /News/
        public ActionResult Index()
        {
            var query = (from c in db.categories
                         from x in db.contents
                         where c.parent_id == 2 && x.catid == c.id
                         select x);
            
            return View(query);
        }
        //Category
        [Authorize]
        public ActionResult ListCategory()
        {
            var query = (from c in db.categories
                         where c.parent_id == 2 
                         select c);

            return View(query);
        }
        [Authorize]
        public ActionResult CreateCategory()
        {
            return View();
        }
        [HttpPost,Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult CreateCategory([Bind(Include = "title,note")] category category)
        {
            if (ModelState.IsValid)
            {
                category.parent_id = 2;
                db.categories.Add(category);
                db.SaveChanges();
                return RedirectToAction("ListCategory");
            }

            return View(category);
        }
        [HttpPost, Authorize]
        public JsonResult DeleteCategory(int id)
        {
            category category = db.categories.Find(id);
            var content = db.contents.Where(m => m.catid == id);
            foreach(var item in content)
            {

                db.contents.Remove(item);
            }
            db.categories.Remove(category);
            db.SaveChanges();
            return Json("Xóa thể loại thành công!");
        }
        [Authorize]
        public ActionResult EditCategory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category category = db.categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }
        [HttpPost, Authorize]
        public ActionResult EditCategory([Bind(Include = "id,title,note")] category category)
        {
            if (ModelState.IsValid)
            {
                category.parent_id = 2;
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ListCategory");
            }
            return View(category);
        }
        //News
        [Authorize]
        public ActionResult ListNews(int? page)
        {
            //int pageSize = 8;
            //int pageNumber = (page ?? 1);
            //IPagedList<content> contents = null;
            //contents = (from c in db.categories
            //            from x in db.contents
            //            where c.parent_id == 2 && x.catid == c.id
            //            select x).OrderByDescending(s => s.id).ToPagedList(pageNumber, pageSize);
            var contents = (from c in db.categories
                        from x in db.contents
                        where c.parent_id == 2 && x.catid == c.id
                        select x).OrderByDescending(s => s.id).ToList();
            return View(contents);
        }
        [Authorize]
        public ActionResult CreateNews()
        {
            var countries = new SelectList(db.categories.Where(c => c.parent_id == 2).ToArray(), "id", "title");
            ViewBag.Category = countries;
            return View();
        }
        [HttpPost, Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult CreateNews([Bind(Include = "title,image,introtext,fulltext,catid")] content content)
        {
            if (ModelState.IsValid)
            {
                string CurrentUser = null;
                if (System.Web.HttpContext.Current.Request.IsAuthenticated)
                {
                    CurrentUser = System.Web.HttpContext.Current.User.Identity.Name;
                }
                content.create_by = CurrentUser;
                db.contents.Add(content);
                db.SaveChanges();
                return RedirectToAction("ListNews");
            }

            return View(content);
        }
        [HttpPost, Authorize]
        public JsonResult DeleteNews(int id)
        {
            content content = db.contents.Find(id);
            db.contents.Remove(content);
            db.SaveChanges();
            return Json("Xóa tin thành công!");
        }
        [Authorize]
        public ActionResult EditNews(int? id)
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
            var countries = new SelectList(db.categories.Where(c => c.parent_id == 2).ToArray(), "id", "title",content.catid);
            ViewBag.Category = countries;
            return View(content);
        }
        [HttpPost, Authorize]
        public ActionResult EditNews([Bind(Include = "id,title,fulltext,introtext,image,catid")] content content)
        {
            if (ModelState.IsValid)
            {
                string CurrentUser = null;
                if (HttpContext.Request.IsAuthenticated)
                {
                    CurrentUser = HttpContext.User.Identity.Name;
                }
                content.create_by = CurrentUser;
                db.Entry(content).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ListNews");
            }
            return View(content);
        }
        // GET: /News/Details/5
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

        // GET: /News/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="id,title,introtext,fulltext,state,catid,created,create_by,image,ordering,hit")] content content)
        {
            if (ModelState.IsValid)
            {
                db.contents.Add(content);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(content);
        }

        // GET: /News/Edit/5
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

        // POST: /News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="id,title,introtext,fulltext,state,catid,created,create_by,image,ordering,hit")] content content)
        {
            if (ModelState.IsValid)
            {
                db.Entry(content).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(content);
        }

        // GET: /News/Delete/5
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

        // POST: /News/Delete/5
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
        public ActionResult NewsRelated(int? id)
        {
            var query = (from c in db.categories
                         from x in db.contents
                         where c.parent_id == 2 && x.catid == c.id && x.catid== id
                         select x).OrderByDescending(x => x.id).Take(4);
            return PartialView(query);
        }
        public ActionResult TypeOfNews()
        {

            return PartialView(db.categories.Where(c => c.parent_id == 2));
        }
    }
}
