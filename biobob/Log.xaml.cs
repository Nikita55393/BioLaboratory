using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using ClassLibrary1;
using static System.Net.Mime.MediaTypeNames;

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для Log.xaml
    /// </summary>
    public partial class Log : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        string fam, tel, potch, log, pass, pass2;

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            textBox1.Text = "";
            textBox1.Clear();
            textBox3.Text = "";
            textBox3.Clear();
            textBox4.Text = "";
            textBox4.Clear();
            textBox5.Text = "";
            textBox5.Clear();
            textBox6.Text = "";
            textBox6.Clear();
        }
        int n = 1;

        private void textBox2_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            foreach (char c in e.Text)
            {
                if (char.IsLetter(c))
                {
                    e.Handled = true;
                    return;
                }
            }
            int maxLength = 11; // Максимальное количество цифр, которое можно ввести

            if (textBox2 != null && textBox2.Text.Length >= maxLength)
            {
                e.Handled = true; // Отменить ввод, если достигнуто максимальное количество символов
            }
            else if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true; // Отменить ввод, если введенный символ не является цифрой
            }
        }

        private void textBox1_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            foreach (char c in e.Text)
            {
                if (char.IsDigit(c))
                {
                    e.Handled = true;
                    return;
                }
            }
        }

        private void textBox4_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox4.Text.Length > 20) // Укажите нужное количество символов
            {
                textBox4.Text = textBox4.Text.Substring(0, 20); // Ограничиваем количество символов
                textBox4.Select(textBox4.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void textBox5_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox5.Text.Length > 15) // Укажите нужное количество символов
            {
                textBox5.Text = textBox5.Text.Substring(0, 15); // Ограничиваем количество символов
                textBox5.Select(textBox5.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void textBox6_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox6.Text.Length > 15) // Укажите нужное количество символов
            {
                textBox6.Text = textBox6.Text.Substring(0, 15); // Ограничиваем количество символов
                textBox6.Select(textBox6.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void textBox3_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox3.Text.Length > 30) // Укажите нужное количество символов
            {
                textBox3.Text = textBox3.Text.Substring(0, 30); // Ограничиваем количество символов
                textBox3.Select(textBox3.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void textBox1_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox1.Text.Length > 20) // Укажите нужное количество символов
            {
                textBox1.Text = textBox1.Text.Substring(0, 20); // Ограничиваем количество символов
                textBox1.Select(textBox1.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            fam = textBox1.Text;
            tel = textBox2.Text;
            potch = textBox3.Text;
            log = textBox4.Text;
            pass = textBox5.Text;
            pass2 = textBox6.Text;
            if (textBox1.Text != "" && textBox2.Text != "" && textBox3.Text != "" && textBox4.Text != "" && Combo != null)
            {
                if (Class1.CheckMail(potch))
                {
                    if (Class1.Checklogin(log))
                    {
                        if (Class1.CheckPassword(pass))
                        {
                            if (pass == pass2)
                            {
                                if (tel.Length < 11)
                                {
                                    MessageBox.Show("Введите 11 цифр, для номера телефона!");
                                    // Можно также блокировать ввод новых символов, установив textBox.IsReadOnly = true;
                                }
                                else
                                {
                                    Тип_пользователя na = db.Тип_пользователя.Where(x => x.Наименование == Combo.Text).FirstOrDefault();
                                    User_ registr = new User_
                                    {
                                        name = fam,
                                        login = log,
                                        email = potch,
                                        password = pass,
                                        type = na.Код_пользователя
                                    };
                                    n++;
                                    db.User_.Add(registr);
                                    db.SaveChanges();
                                    MessageBox.Show("Пользователь зарегистрирован!");
                                }
                                
                            }
                            else
                            {
                                MessageBox.Show("пароли не совпадают!");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Пароль не соответствует условиям сложности.");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Логин не соответствует условиям сложности.");
                    }
                }
                else
                {
                    MessageBox.Show("Некорректный формат почты.");
                }
            }
            else
            {
                MessageBox.Show("Не все данные введены!");
            }
        }
        List<Тип_пользователя> typ = new List<Тип_пользователя>();
        User_ user;
        public Log(User_ user)
        {
            InitializeComponent();
            typ = db.Тип_пользователя.ToList();
            this.user = user;
            for (int i = 0; i < typ.Count; i++)
            {
                Combo.Items.Add(typ[i].Наименование);
            }
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            user4 yu = new user4(user);
            yu.Show();
            this.Close();
        }
    }
}
