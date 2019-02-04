using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jwt_Auth.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string Name { set; get; }
        public string Username { set; get; }
        public string Password { set; get; }
        public string Contact { set; get; }
        public string Country { set; get; }
        public int Salary { set; get; }
    }
}