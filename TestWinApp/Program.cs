using System;

namespace TestWinApp 
{
    internal class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0) return;
            
            int i = int.Parse(args[0].Split('=')[1]);
            int j = int.Parse(args[1].Split('=')[1]);

            int result = i + j;

            Console.WriteLine(result);
        }
    }
}