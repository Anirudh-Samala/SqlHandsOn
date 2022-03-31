using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace FileHandlingDemo
{
    class FileHandling
    {
        
       public void ReadFile()
         {
            FileStream fileStream = new FileStream(@"C:\Users\aniru\OneDrive\Desktop\Training\networklog.txt", FileMode.Open,FileAccess.Read);
            StreamReader reader = new StreamReader(fileStream);
            Console.WriteLine("Id\tSource\t\tDestination\tDate\t\tTime\t\tStatus\t\tNetwork");
            while(reader.Peek()>0)
            {
                var Id = reader.ReadLine();
                string[] idstr = Id.Split(':');
                string id = idstr[1];
                
                var Source = reader.ReadLine();
                string[] sourcestr = Source.Split(':');
                string source = sourcestr[1];
                
                var Des = reader.ReadLine();
                string[] dstr = Des.Split(':');
                int Destination = Convert.ToInt32(dstr[1]);

                var da = reader.ReadLine();
                string[] datestr = da.Split(' ');
                string[] datestr1 = datestr[0].Split(':');
                string Date = datestr1[1];
                string Time = datestr[1];
                string Time1 = datestr[2];

                var st = reader.ReadLine();
                string[] ststr = st.Split(':');
                string Status = ststr[1];

                var net = reader.ReadLine();
                string[] netstr = net.Split(':');
                string Network = netstr[1];

                reader.ReadLine();
                Console.WriteLine(id + "\t" + source + "\t" + Destination + "\t" + Date + "\t" + Time +""+Time1+ "\t" + Status + "\t\t"+Network);
                
            }
            fileStream.Close();
        }
    }
    
}
