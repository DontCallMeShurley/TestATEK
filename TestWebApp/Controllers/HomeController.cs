using Microsoft.AspNetCore.Mvc;

namespace TestWebApp.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Open()
        {
            string filePath = "C:\\SoulsOfWorld.exe";
            System.Diagnostics.Process.Start(filePath);
            return Ok();
        }
    }
}
