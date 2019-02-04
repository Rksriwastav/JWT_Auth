using Jwt_Auth.Filters;
using Jwt_Auth.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace Jwt_Auth.Controllers
{
    [JwtAuthentication]
    public class CustomerController : ApiController
    {
        [System.Web.Http.HttpGet]
        public IHttpActionResult CustomerHighestSalary(int salValue, string countryName)
        {
            Employee user = GetCustomerHighestSalary(salValue, countryName);
            if (user != null)
                return Ok(user);
            else
                return NotFound();
        }

        private Employee GetCustomerHighestSalary(int salValue, string countryName)
        {
            string QueryString = string.Empty;
            Employee employee = new Employee();
            DataTable dataTable = new DataTable();
            string connectionstring = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionstring);
            using (sqlConnection)
            {
                if (countryName == "null")
                    QueryString = string.Format(@"Select * from UserTable a Where {0} = (Select Count(distinct Salary) from UserTable b where a.Salary <= b.Salary)", salValue);

                else
                    QueryString = string.Format(@"Select * from UserTable a where Country= '{0}'", countryName);

                SqlCommand sqlCommand = new SqlCommand(QueryString, sqlConnection);
                sqlConnection.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                using (sqlDataAdapter)
                {
                    sqlDataAdapter.Fill(dataTable);
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        employee.Name = dr["Name"].ToString();
                        employee.Username = dr["Username"].ToString();
                        employee.Password = dr["Password"].ToString();
                        employee.Contact = dr["Contact"].ToString();
                        employee.Country = dr["Country"].ToString();
                        employee.Salary = Convert.ToInt32(dr["Salary"]);
                    }
                    sqlConnection.Close();
                }
                return employee;
            }
        }
    }
}