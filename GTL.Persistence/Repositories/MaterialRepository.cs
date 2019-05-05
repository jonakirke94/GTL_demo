﻿using System;
using System.Collections.Generic;
using System.Text;
using Dapper;
using GTL.Application.Interfaces.Repositories;
using GTL.Application.Interfaces.UnitOfWork;
using GTL.Domain.Entities;

namespace GTL.Persistence.Repositories
{
    public class MaterialRepository : IMaterialRepository
    {
        private readonly IGTLContext _context;
        public MaterialRepository(IGTLContext context)
        {
            _context = context;
        }

        public void Add(Material material)
        {
            using (var cmd = _context.CreateCommand())
            {
                const string query = @"INSERT INTO [Material] ([ISBN], [Title], [Description], [Edition], [Type])
                 VALUES (@isbn, @title, @description, @edition, @type)";

                var para = new DynamicParameters();
                para.Add("@isbn", material.ISBN.Number);
                para.Add("@title", material.Title);
                para.Add("@description", material.Description);
                para.Add("@edition", material.Edition);
                para.Add("@type", material.Type.ToString());

                cmd.Connection.Execute(query, para, cmd.Transaction);
            }
        }

        public Material GetByTitle(string title)
        {
            throw new NotImplementedException();
        }

        public Material GetByIsbn(string isbn)
        {
            throw new NotImplementedException();
        }

        public Material GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(Material material)
        {
            throw new NotImplementedException();
        }
    }
}
