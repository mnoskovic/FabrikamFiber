namespace FabrikamFiber.Web
{
    using System.Data.Entity;
    using System.Web;
    using System.Web.Mvc;
    using System.Web.Routing;

    using FabrikamFiber.DAL.Data;

    public class MvcApplication : HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                  "Default", // Route name
                  "{controller}/{action}/{id}", // URL with parameters
                  new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
              );
        }

        protected void Application_Start()
        {

#if debug
            Database.SetInitializer<FabrikamFiberWebContext>(new FabrikamFiberDatabaseInitializer());
#else
            Database.SetInitializer<FabrikamFiberWebContext>(null);
#endif

            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }
    }
}