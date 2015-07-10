using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace education.Models
{
    public class MyRoleProvider  : RoleProvider
    {
        private educationEntities db = new educationEntities();
        public override string[] GetRolesForUser(string username)
        {
            user user = db.users.FirstOrDefault(u => u.email.Equals(username, StringComparison.CurrentCultureIgnoreCase));
                var roles = from r in db.roles
                            where user.usersinrole.roleid == r.id
                            select r.name;
                if (roles != null)
                    return roles.ToArray();
                else
                    return new string[] { }; ;
        }
        public override bool IsUserInRole(string username, string roleName)
        {
            user user = db.users.FirstOrDefault(u => u.email.Equals(username, StringComparison.CurrentCultureIgnoreCase));

                var roles = from r in db.roles
                            where user.usersinrole.roleid == r.id
                            select r.name;
                if (user != null)
                    return roles.Any(r => r.Equals(roleName, StringComparison.CurrentCultureIgnoreCase));
                else
                    return false;
        }
        public override string[] GetAllRoles()
        {
                return db.roles.Select(r => r.name).ToArray();
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}