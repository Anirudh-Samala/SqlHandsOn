using System;
using System.IO;

namespace FileHandlingDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            FileHandling fileHandling = new FileHandling();
            //fileHandling.WriteFile();
            fileHandling.ReadFile();
            Console.ReadLine();
        }
    }
}
