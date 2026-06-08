using Microsoft.AspNetCore.Mvc;

namespace PharmaCare.ViewComponents
{
    public class TopNavViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
