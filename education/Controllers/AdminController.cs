using education.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace education.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        private educationEntities db = new educationEntities();
        [Authorize]
        public ActionResult ChangePass()
        {
            string CurrentUser = null;
            if (System.Web.HttpContext.Current.Request.IsAuthenticated)
            {
                CurrentUser = System.Web.HttpContext.Current.User.Identity.Name;
            }
            int userId = db.users.FirstOrDefault(x => x.email == CurrentUser).id;
            var user = db.users.Find(userId);
            return View(user);
        }
        [Authorize,HttpPost]
        public ActionResult ChangePass([Bind(Include = "id,password,fullname,address,email")] user user)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();
                    ViewBag.state = "Complete";
                }
                catch (Exception e)
                {
                    ViewBag.state = e.Message;
                }
            }

            return View("ChangePass");
        }
        [Authorize]
        public ActionResult UserInfo()
        {
            string CurrentUser = null;
            if (HttpContext.Request.IsAuthenticated)
            {
                CurrentUser = HttpContext.User.Identity.Name;
            }
            int userId = db.users.FirstOrDefault(x => x.email == CurrentUser).id;
            user user = db.users.Find(userId);
            return View(user);
        }
        [Authorize(Roles="superadmin")]
        public ActionResult ListUser()
        {
            return View(db.users);
        }

        [HttpPost, Authorize(Roles = "superadmin")]
        public JsonResult DeleteUser(int id)
        {
            user user = db.users.Find(id);
            db.usersinroles.Remove(user.usersinrole);
            db.users.Remove(user);
            db.SaveChanges();
            return Json("Xóa user thành công!");
        }
        [Authorize(Roles = "superadmin")]
        public ActionResult EditUser(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            user user = db.users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            //var countries = new SelectList(db.roles, "id", "name",user.usersinrole.roleid);
            //ViewBag.Category = countries;
            return View(user);
        }

        // POST: /Services/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, Authorize(Roles = "superadmin")]
        [ValidateAntiForgeryToken]
        public ActionResult EditUser([Bind(Include = "id,fullname,address,phone,email,password")] user user)
        {
            if (ModelState.IsValid)
            {
               // int id = Convert.ToInt32(Request.Form["role"]);
                //var uir = db.usersinroles.Find(user.id);
                //uir.roleid = id;
                //user.usersinrole = uir;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                Roles.DeleteCookie();
                return RedirectToAction("ListUser");
            }
            return View(user);
        }
        [Authorize(Roles = "superadmin")]
        public ActionResult CreateUser()
        {
            return View();
        }
        [HttpPost, Authorize(Roles = "superadmin")]
        [ValidateAntiForgeryToken]
        public ActionResult CreateUser([Bind(Include = "id,fullname,address,phone,email,password")] user user)
        {
            if (ModelState.IsValid)
            {
                user.usersinrole = new usersinrole();
                user.usersinrole.roleid = 2;
                user.usersinrole.userid = user.id;
                db.users.Add(user);
                db.SaveChanges();
                return RedirectToAction("ListUser");
            }

            return View(user);
        }
        public ActionResult RoleCreate()
        {
            return View(db.users);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RoleCreate(string RoleName)
        {

            Roles.CreateRole(Request.Form["RoleName"].ToString());
            return RedirectToAction("Index");
        }
        //
        // GET: /Admin/
        [Authorize]
        public ActionResult Index()
        {
            ViewBag.user = db.users.Count();
            ViewBag.news = (from c in db.categories
                            from x in db.contents
                            where c.parent_id == 2 && x.catid == c.id
                            select x).Count();
            ViewBag.category = db.categories.Where(m => m.parent_id == 2).Count();
            return View();
        }
        [HttpGet,AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            if (HttpContext.Request.IsAuthenticated)
            {
                return Redirect("Index");
            }
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }
        [HttpPost,AllowAnonymous]
        public ActionResult Login(Models.user model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var user = CheckUser(model.email, model.password);
                if (user != null)
                {
                    FormsAuthentication.SetAuthCookie(user.email, false);
                    return RedirectToLocal(returnUrl);
                }
                else
                {
                    ModelState.AddModelError("", "Invalid username or password.");
                }
                return View("Login", model);
            }
             return View("Login", model);
             

            // If we got this far, something failed, redisplay form
            
        }
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            Roles.DeleteCookie();
            return RedirectToAction("Login","Admin", null);
        }
        public user CheckUser(string UserName, string Password)
        {
            var UserLogOn = db.users.SingleOrDefault(m => m.email == UserName && m.password == Password);
            return UserLogOn;
        }
        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Admin");
            }
        }
        [Authorize]
        public ActionResult About()
        {
            content content = db.contents.Find(21);
            return View(content);
        }
        [Authorize]
        public ActionResult About_Edit()
        {
            content content = db.contents.Find(21);
            if (content == null)
            {
                return HttpNotFound();
            }
            return View(content);
        }

        // POST: /Services/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, Authorize, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult About_Edit([Bind(Include = "id,title,introtext,fulltext")] content content)
        {
            if (ModelState.IsValid)
            {
                db.Entry(content).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("About");
            }
            return View(content);
        }
	}
}