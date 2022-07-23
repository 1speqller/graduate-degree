using Microsoft.VisualStudio.TestTools.UnitTesting;
using ClassLibraryPassword;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SanPomosh.Windows;

namespace ClassLibraryPassword.Tests
{
    [TestClass()]
    public class PasswordCheckerTests
    {
        
        
        [TestMethod()]
        public void Check_8Symbols_ReturnsTrue()
        {
            string password = "ASqw12$$";
            bool expected = true;
            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(expected, actual);
        }

        [TestMethod()]
        public void Check_4Symbols_ReturnsFalse()
        {
            string password = "Aq1$";
            
            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.IsFalse(actual);
        }

        [TestMethod()]
        public void Check_50Symbols_ReturnsFalse()
        {
            string password = "ASqw12$$ASqw12$$ASqw12$$ASqw12$$ASqw12$$ASqw12$$ASqw12$$";
            bool expected = false;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }
        [TestMethod()]
        public void Check_PasswordWithDigits_ReturnsTrue()
        {
            string password = "ASDqwe1$";
            bool expected = true;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }

        [TestMethod()]
        public void Check_PasswordWithoutDigits_ReturnsFalse()
        {
            string password = "ASDqweASD$";
            bool expected = false;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }

        [TestMethod()]
        public void Check_PasswordWithSpecSymbols_ReturnsTrue()
        {
            string password = "Aqwe123$";
            bool expected = true;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }
        [TestMethod()]
        public void Check_PasswordWithoutSpecSymbols_ReturnsFalse()
        {
            string password = "ASDqwe123";
            bool expected = false;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }
        [TestMethod()]
        public void Check_PasswordWithCapsSymbols_ReturnsTrue()
        {
            string password = "Aqwe123$";
            bool expected = true;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }
        [TestMethod()]
        public void Check_PasswordWithoutCapsSymbols_ReturnsFalse()
        {
            string password = "asdqwe123$";
            bool expected = false;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }
        [TestMethod()]
        public void Check_PasswordWithLowerSymbols_ReturnsTrue()
        {
            string password = "ASDq123$";
            bool expected = true;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }
        [TestMethod()]
        public void Check_PasswordWithoutLowerSymbols_ReturnsFalse()
        {
            string password = "ASDQWE123$";
            bool expected = false;

            bool actual = PasswordChecker.ValidatePassword(password);
            Assert.AreEqual(actual, expected);
        }
    }
}