using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Task2.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Go(int num1, int num2)
        {
            string url = "C:\\TestWinApp.exe";
            string arguments = $"i={num1} j={num2}";

            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.FileName = url;
            startInfo.Arguments = arguments;
            startInfo.RedirectStandardOutput = true;

            Process process = new Process();
            process.StartInfo = startInfo;

            process.Start();

            process.WaitForExit();
            string output = process.StandardOutput.ReadToEnd();
            return Ok(output);
        }
    
}
}
