using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class Class1
    {
        public static bool CheckMail(string mail)
        {
            // Простая проверка, что строка содержит символ @ и .
            return !string.IsNullOrWhiteSpace(mail) && Regex.IsMatch(mail, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");
        }

        // Метод для проверки сложности пароля
        public static bool CheckPassword(string password)
        {
            // Пароль не должен быть простым, должен содержать хотя бы одну букву,
            // хотя бы один символ и иметь длину минимум 8 символов.
            return !string.IsNullOrWhiteSpace(password) &&
                   Regex.IsMatch(password, @"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
        }
        public static bool Checklogin(string login)
        {
            // Пароль не должен быть простым, должен содержать хотя бы одну букву,
            // хотя бы один символ и иметь длину минимум 8 символов.
            return !string.IsNullOrWhiteSpace(login) &&
                   Regex.IsMatch(login, @"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
        }
    }
}
