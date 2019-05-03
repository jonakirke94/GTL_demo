﻿using GTL.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using GTL.Application.UseCases.Members.Commands.CreateMember;
using System.Data;

namespace GTL.Application.Interfaces.Repositories
{
    public interface IMemberRepository
    {
        Member GetMemberBySsn(string ssn);

        void CreateMember(Member member);
    }
}

