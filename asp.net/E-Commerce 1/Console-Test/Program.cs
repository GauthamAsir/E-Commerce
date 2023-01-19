using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using DataLayer;

namespace Console_Test
{
    internal class Program
    {

        DBHelper dBHelper = new DBHelper();

        static void Main(string[] args)
        {
            var anInstanceofMyClass = new Program();
            anInstanceofMyClass.exec();
        }

        public void exec() {
            var s = dBHelper.getCustomerDetailById(1000);
            var t = dBHelper.getCustomerDetailByEmail("gauthamasir@gmail.com");
            Console.WriteLine(JsonSerializer.Serialize(s));
            Console.WriteLine(JsonSerializer.Serialize(t));
            Console.ReadLine();
        }
    }
}
