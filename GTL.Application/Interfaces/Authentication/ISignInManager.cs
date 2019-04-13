﻿using GTL.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace GTL.Application.Interfaces.Authentication
{
    public interface ISignInManager
    {
        Task SignInAsync(User user, bool isPersistent);

        Task SignOutAsync();

        Task<bool> ValidateLoginAsync(ClaimsPrincipal principal);

        Task<User> GetCurrentUserAsync();

        bool IsSignedIn(ClaimsPrincipal principal);
    }
}
