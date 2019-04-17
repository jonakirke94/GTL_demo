﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using GTL.Application.Authorization;
using GTL.Domain.Entities;

namespace GTL.Application.Interfaces.Authentication
{
    public interface IAuthService
    {
        Task<IdentityModels.SignInResult> ValidatePasswordAsync(string email, string password);

        bool HasPermission(PermissionLevel permission, User user);
    }
}
