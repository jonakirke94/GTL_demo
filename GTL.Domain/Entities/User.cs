﻿using System;
using System.Collections.Generic;
using GTL.Domain.Enums;

namespace GTL.Domain.Entities
{
    public class User
    {
        public int Id { get; set; }
        
        // Always set collections setter to private and instantiate it in the constructor 
        public User()
        {
            Books = new List<Material>();
        }

        public string Name { get; set; }
   
        public string NormalizedName { get; set; }

        public string Email { get; set; }

        public string NormalizedEmail { get; set; }

        public string PasswordHash { get; set; }

        public string PasswordSalt { get; set; }

        public string City { get; set; }

        public string ZipCode { get; set; }

        public DateTime LastChanged { get; set; }

        public ICollection<Material> Books { get; private set; }

        public PermissionLevel PermissionLevel { get; set; }
    }
}
