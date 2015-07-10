using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace education
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
            "adminuser", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/UserManager", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "admin", action = "ListUser", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "adminuseredit", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/UserManager/edit/{id}", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "admin", action = "EditUser", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "adminusercreate", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/UserManager/create", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "admin", action = "CreateUser", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "adminservice", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/Service", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "services", action = "ListService", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "adminservicecreate", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/Service/Create", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "services", action = "Create", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "adminserviceedit", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/Service/edit/{id}", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "services", action = "edit", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "admincategory", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/Category", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "News", action = "ListCategory", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "newcategory", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/Category/Create", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "News", action = "CreateCategory", id = UrlParameter.Optional }
            ); 
            routes.MapRoute(
             "editcategory", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
             "Admin/Category/Edit/{id}", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
             defaults: new { controller = "News", action = "EditCategory", id = UrlParameter.Optional }
             );
            routes.MapRoute(
            "adminnews", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/News", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "News", action = "ListNews", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            "createnews", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
            "Admin/News/Create", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
            defaults: new { controller = "News", action = "CreateNews", id = UrlParameter.Optional }
            );

            routes.MapRoute(
             "editnews", // chỉ là tên của Route dùng để phân biệt Route này vơi Route kia thôi, bạn muốn đặt sao cũng được
             "Admin/News/Edit/{id}", // Link sẽ hiển thị trên address bar, tương tự như 'san-pham/12/ten-san-pham '
             defaults: new { controller = "News", action = "EditNews", id = UrlParameter.Optional }
             );
            routes.MapRoute(
                name: "home",
                url: "test",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Test", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
