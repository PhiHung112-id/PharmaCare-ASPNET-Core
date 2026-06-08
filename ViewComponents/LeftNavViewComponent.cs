using Microsoft.AspNetCore.Mvc;

namespace PharmaCare.ViewComponents
{
    public class LeftNavViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
