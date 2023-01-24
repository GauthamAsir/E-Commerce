using DataLayer;
using Microsoft.Owin.Infrastructure;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using Microsoft.Owin.Security.OAuth.Messages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;

namespace WebApi.Models
{

    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        DBHelper dBHelper = new DBHelper();

        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
            return Task.CompletedTask;
        }

        public override Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            Console.WriteLine(context.UserName);
            Dictionary<string, dynamic> res = dBHelper.login(context.UserName, context.Password);
            if (res["status"] == 0)
            {
                context.SetError("credentital_error", "Provided email or password is incorrect");
                return Task.CompletedTask;
            }

            var props = new AuthenticationProperties(new Dictionary<string, string> {
                { "status", res["status"].ToString() },
                { "name", res.ContainsKey("custName") ? res["custName"] : "" },
                { "email", context.UserName },
                { "custId", res.ContainsKey("customerId") ? res["customerId"].ToString() : "" },
                { "roleId", res.ContainsKey("roleid") ? res["roleid"].ToString() : "" },
            });

            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            identity.AddClaim(new Claim(ClaimTypes.Name, res.ContainsKey("custName") ? res["custName"] : ""));
            identity.AddClaim(new Claim(ClaimTypes.Email, context.UserName));
            identity.AddClaim(new Claim("custId", res.ContainsKey("customerId") ? res["customerId"].ToString() : ""));
            identity.AddClaim(new Claim(ClaimTypes.Role, res.ContainsKey("roleid") ? res["roleid"].ToString() : ""));
            var ticket = new AuthenticationTicket(identity, props);

            DateTimeOffset currentUtc = new SystemClock().UtcNow;
            ticket.Properties.IssuedUtc = currentUtc;

            context.Validated(ticket);

            return Task.CompletedTask;
        }

        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
            {
                context.AdditionalResponseParameters.Add(property.Key, property.Value);
            }

            return Task.FromResult<object>(null);
        }

    }
}