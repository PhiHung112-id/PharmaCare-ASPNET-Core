using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using PharmaCare.Models;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace PharmaCare.Models
{
    public class LoginViewModel
    {
        public string Username { get; set; } = "";
        public string Password { get; set; } = "";
        public bool RememberMe { get; set; }
    }
}

namespace PharmaCare.Controllers
{
    public class AuthController : Controller
    {
        [HttpGet]
        [Route("/tai-khoan/dang-nhap", Name = "LoginPage")]
        public IActionResult Login(string? ReturnUrl = null)
        {
            if (User.Identity != null && User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }

            ViewData["ReturnUrl"] = ReturnUrl;
            return View();
        }

        // logic sk đăng nhập
        [HttpPost]
        [Route("/tai-khoan/dang-nhap")]
        public async Task<IActionResult> Login(PharmaCare.Models.LoginViewModel model, string ReturnUrl = null)
        {
            if (!ModelState.IsValid) return View(model);

            using var db = new DBContext();

            var user = db.Staffs.FirstOrDefault(x => x.TaiKhoan == model.Username && x.MatKhau == model.Password);

            if (user == null)
            {
                ViewBag.Error = "Tên đăng nhập hoặc mật khẩu không đúng!";
                ViewData["ReturnUrl"] = ReturnUrl;
                return View(model);
            }

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.HoTen ?? "Khách"),
                new Claim(ClaimTypes.Role, user.Quyen ?? "Staff"),
                new Claim("Username", user.TaiKhoan ?? "")
            };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var authProperties = new AuthenticationProperties { IsPersistent = model.RememberMe };

            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(claimsIdentity),
                authProperties);

            if (!string.IsNullOrEmpty(ReturnUrl) && Url.IsLocalUrl(ReturnUrl))
            {
                return Redirect(ReturnUrl);
            }

            return RedirectToAction("Index", "Home");
        }

        // logic sk đăng xuất
        [HttpGet]
        [Route("/tai-khoan/dang-xuat", Name = "LogoutPage")]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return RedirectToRoute("LoginPage");
        }
    }
}