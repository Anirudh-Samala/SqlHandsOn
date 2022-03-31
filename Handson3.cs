using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Linq;

namespace FileHandlingDemo
{
    class Handson3
    {
        public void ReadFile()
        {
            FileStream fs = new FileStream(@"C:\Users\aniru\OneDrive\Desktop\Training\mydata.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            Console.WriteLine("input tags in the HTML Page are :");
            while(sr.Peek()>0)
            {
                var id = sr.ReadLine();
                string[] str = id.Split('>');
                string strcheck = "input";
                for(int i=0 ; i<str.Length ; i++)
                {
                    if (str[i].Contains(strcheck))
                    {
                        Console.WriteLine(str[i] + ">");
                    }
                }
            }
        }
    }
}
