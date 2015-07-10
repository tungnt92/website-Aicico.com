 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc.Html;
using System.Linq.Expressions;
using System.Web.Mvc;

namespace education.Helper
{
    public static class HtmlHelper
    {
        public static string MenuItem(
            this System.Web.Mvc.HtmlHelper htmlHelper,
        string controller
            )
        {
            var routeData = htmlHelper.ViewContext.ParentActionViewContext.RouteData;
            var currentController = routeData.GetRequiredString("controller");
            var currentAction = routeData.GetRequiredString("action");
            if (string.Equals(currentAction, controller, StringComparison.OrdinalIgnoreCase))
                return "active";
            if (string.Equals(currentController, controller, StringComparison.OrdinalIgnoreCase) && !string.Equals(currentAction, "About", StringComparison.OrdinalIgnoreCase))
            {
                return "active";

            }

            //var link = htmlHelper.ActionLink("<span>{LinkText}<span>", actionName, controllerName).ToHtmlString();
            //return new MvcHtmlString(link.Replace("{LinkText}", linkText));

            return "";
        }
    }
}