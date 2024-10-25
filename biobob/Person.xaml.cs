using ClassLibrary1;
using Polly.Caching;
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
using System.ComponentModel.DataAnnotations;
using System.Runtime.ConstrainedExecution;

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для Person.xaml
    /// </summary>
    public partial class Person : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        string tel, fam, potch, serpol;
        int num, serpas;

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            User h = new User(user);
            h.Show();
            this.Close();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            textBox1.Text = "";
            textBox1.Clear();
            textBox2.Text = "";
            textBox2.Clear();
            textBox3.Text = "";
            textBox3.Clear();
            textBox4.Text = "";
            textBox4.Clear();
            textBox5.Text = "";
            textBox5.Clear();
            textBox6.Text = "";
            textBox6.Clear();
        }
        List<Страховая> str = new List<Страховая>();
        List<Полис> poli = new List<Полис>();

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

        private void textBox3_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            foreach (char c in e.Text)
            {
                if (char.IsLetter(c))
                {
                    e.Handled = true;
                    return;
                }
            }
            int maxLength = 4; // Максимальное количество цифр, которое можно ввести

            if (textBox3 != null && textBox3.Text.Length >= maxLength)
            {
                e.Handled = true; // Отменить ввод, если достигнуто максимальное количество символов
            }
            else if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true; // Отменить ввод, если введенный символ не является цифрой
            }
        }

        private void textBox4_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            foreach (char c in e.Text)
            {
                if (char.IsLetter(c))
                {
                    e.Handled = true;
                    return;
                }
            }
            int maxLength = 6; // Максимальное количество цифр, которое можно ввести

            if (textBox4 != null && textBox4.Text.Length >= maxLength)
            {
                e.Handled = true; // Отменить ввод, если достигнуто максимальное количество символов
            }
            else if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true; // Отменить ввод, если введенный символ не является цифрой
            }
        }

        private void textBox6_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            foreach (char c in e.Text)
            {
                if (char.IsLetter(c))
                {
                    e.Handled = true;
                    return;
                }
            }
            int maxLength = 16; // Максимальное количество цифр, которое можно ввести

            if (textBox6 != null && textBox6.Text.Length >= maxLength)
            {
                e.Handled = true; // Отменить ввод, если достигнуто максимальное количество символов
            }
            else if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true; // Отменить ввод, если введенный символ не является цифрой
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

        private void textBox5_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox5.Text.Length > 30) // Укажите нужное количество символов
            {
                textBox5.Text = textBox5.Text.Substring(0, 30); // Ограничиваем количество символов
                textBox5.Select(textBox5.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }


        User_ user;
        public Person(User_ user)
        {
            InitializeComponent();
            this.user = user;
            str = db.Страховая.ToList();
            for (int i = 0; i < str.Count; i++)
            {
                cbStra.Items.Add(str[i].Наименование);
            }
            poli = db.Полис.ToList();
            for (int i = 0; i < poli.Count; i++)
            {
                cbTyp.Items.Add(poli[i].Тип_полиса);
            }
        }
        int n = 1;
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            fam = textBox1.Text;
            tel = textBox2.Text;
            serpas = Convert.ToInt32(textBox3.Text);
            num = Convert.ToInt32(textBox4.Text);
            potch = textBox5.Text;
            serpol = textBox6.Text;
            if (textBox1.Text != "" && textBox2.Text != "" && textBox3.Text != "" && textBox6.Text != "" && textBox5.Text != "" && textBox4.Text != "" && cbTyp != null && cbStra != null)
            {
                if (Class1.CheckMail(potch))
                {
                    if (tel.Length < 11)
                    {
                        MessageBox.Show("Введите 11 цифр, для номера телефона!");
                        // Можно также блокировать ввод новых символов, установив textBox.IsReadOnly = true;
                    }
                    else
                    {
                        if (serpas < 4)
                        {
                            MessageBox.Show("Введите 4 цифр, для серии паспорта!");
                            // Можно также блокировать ввод новых символов, установив textBox.IsReadOnly = true;
                        }
                        else
                        {
                            if (num < 6)
                            {
                                MessageBox.Show("Введите 6 цифр, для номера паспорта!");
                                // Можно также блокировать ввод новых символов, установив textBox.IsReadOnly = true;
                            }
                            else
                            {
                                if (num < 16)
                                {
                                    MessageBox.Show("Введите 16 цифр, для номера полиса!");
                                    // Можно также блокировать ввод новых символов, установив textBox.IsReadOnly = true;
                                }
                                else
                                {
                                    Страховая na = db.Страховая.Where(x => x.Наименование == cbStra.Text).FirstOrDefault();
                                    Полис po = db.Полис.Where(x => x.Тип_полиса == cbTyp.Text).FirstOrDefault();
                                    Паспорт pas = new Паспорт
                                    {
                                        Серия = serpas,
                                        Номер = num
                                    };
                                    db.Паспорт.Add(pas);
                                    db.SaveChanges();
                                    Полис polis = new Полис
                                    {
                                        Номер_полиса = serpol,
                                    };
                                    db.Полис.Add(polis);
                                    db.SaveChanges();
                                    Пациент restr = new Пациент
                                    {
                                        Код_пациента = n,
                                        ФИО = fam,
                                        Телефон = tel,
                                        email = potch,
                                        Дата_рождения = cal.SelectedDate,
                                        Код_полиса = po.Код_полиса,
                                        Код_страховой = na.Код_страховой,
                                        Код_паспорта = pas.Код_паспорта
                                    };
                                    n++;
                                    db.Пациент.Add(restr);
                                    db.SaveChanges();
                                    MessageBox.Show("Пациент добавлен!");
                                }
                                
                            }
                        }
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
    }
}
