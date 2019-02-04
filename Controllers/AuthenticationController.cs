using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Threading;
using System.Web.Http;
using Jwt_Auth.Models;

namespace Jwt_Auth.Controllers
{

    public class AuthenticationController : ApiController
    {
        [CustomAuthorize]
        public string Get()
        {
            if (Thread.CurrentPrincipal.Identity.IsAuthenticated)
            {
               return JwtManager.GenerateToken(Thread.CurrentPrincipal.Identity.Name);
            }
            else
            {
                throw new HttpResponseException(HttpStatusCode.Unauthorized);
            }
        }

    }
}
