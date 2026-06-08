using Microsoft.AspNetCore.Mvc;

namespace PharmaCare.ViewComponents
{
    public class ScriptViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
