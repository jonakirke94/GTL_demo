﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using GTL.Application.UseCases.Loans.Commands.CreateLoan;

namespace GTL.Web.Controllers
{
    public class LoanController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateLoan(CreateLoanCommand command)
        {
            try
            {
                //command.Loan.ReturnDate = null;
                //command.Loan.DueDate = null;
                command.Loan.LoanDate = DateTime.Now;
                await Mediator.Send(command); 
            }
            catch (Exception e)
            {
                ModelState.AddModelError("Unexpected Error", e.Message);
                // redirect to edit view
                return View();
            }

            // redirect to edit view
            TempData["Message"] = "Loan was successfully created";
            return View();
        }
    }
}