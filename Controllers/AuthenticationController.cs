using System.Net;
using System.Web.Http;
using Jwt_Auth.Models;

namespace Jwt_Auth.Controllers
{
    public class AuthenticationController : ApiController
    {
        [AllowAnonymous]
        public string Get(UserDetail user)
        {
            if (CheckUser(user.username, user.password))
            {
                return JwtManager.GenerateToken(user.username);
            }

            throw new HttpResponseException(HttpStatusCode.Unauthorized);
        }

        public bool CheckUser(string username, string password)
        {
            // should check in the database
            return true;
        }
    }
}
