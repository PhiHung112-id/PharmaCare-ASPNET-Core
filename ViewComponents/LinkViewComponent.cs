using Microsoft.AspNetCore.Mvc;

namespace PharmaCare.ViewComponents
{
    public class LinkViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
