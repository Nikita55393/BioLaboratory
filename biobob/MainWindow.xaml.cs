using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using Microsoft.Win32;

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer1 = new DispatcherTimer();
        public BiomaterEntities9 db = new BiomaterEntities9();
        private DispatcherTimer timer;
        private TimeSpan elapsedTime;
        int stat = 0;
        public MainWindow()
        {
            InitializeComponent();
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += timerTick;
        }
        private void ResetTimer()
        {
            elapsedTime = new TimeSpan(0, 0, 0);
            UpdateTimerLabel();
        }
        private void UpdateTimerLabel()
        {
            timerLabel.Content = string.Format("{0:D2}:{1:D2}:{2:D2}", elapsedTime.Hours, elapsedTime.Minutes, elapsedTime.Seconds);
        }
        
        private void timerTick(object sender, EventArgs e)
        {
            elapsedTime = elapsedTime.Add(TimeSpan.FromSeconds(1));
            UpdateTimerLabel();
            if (elapsedTime.Hours == 0 && elapsedTime.Minutes == 00 && elapsedTime.Seconds == 10)
            {
                timer.Stop();
                textBox7.IsEnabled = true;
                textBox8.IsEnabled = true;
                textBox9.IsEnabled = true;
                ResetTimer();
            }
            
        }
       
        string pwd = "";

        public void Capcha()
        {
            String allowchar = " ";
            allowchar = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
            allowchar += "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,y,z";
            allowchar += "1,2,3,4,5,6,7,8,9,0";

            char[] a = { ',' };
            // записываем набор символов в массив 
            String[] ar = allowchar.Split(a);
            //переменная в которой будет хранится значение капчи string temp = " "; //переменная, в которую будет записываться рандомный символ из массива Random r = new Random(); 
            string temp = " ";
            pwd = "";
            Random r = new Random();
            int kol = 4; // количество символов в капче 
            for (int i = 0; i < kol; i++)
            {
                // генерируем рандомный символ из массива // мы берем элемент массива и задаем рандомный индекс элемента //  диапазон рандома начинается с 0 и заканчивается длиной массива символов 
                temp = ar[(r.Next(0, ar.Length))];
                pwd += temp;
                //выводим сформированный текст в поле 

            }
            label2.Content = pwd;
        }
        private void Button1_Click(object sender, RoutedEventArgs e)
        {
            var user = db.User_.FirstOrDefault(x => x.login == textBox7.Text && x.password == textBox8.Text);
            if (user != null)
            {
                int doc = user.id;
                var usering = db.User_.FirstOrDefault(x => x.id == doc);
                if (stat == 0)
                {
                    usering.Статус = true;
                }
                else
                {
                    usering.Статус = false;
                }
                db.SaveChanges();
                if (textBox9.Visibility == Visibility.Visible)
                {
                    if (textBox9.Text == pwd)
                    {

                        if (user.type == 1)
                        {
                            MessageBox.Show("Авторизация успешна");
                            User usr = new User(user);
                            usr.Show(); this.Hide();
                        }
                        else if (user.type == 2)
                        {
                            MessageBox.Show("Авторизация успешна");
                            user2 usr = new user2(user);
                            usr.Show(); this.Hide();
                        }
                        else if (user.type == 3)
                        {
                            MessageBox.Show("Авторизация успешна");
                            user3 usr = new user3(user);
                            usr.Show(); this.Hide();
                        }
                        else if (user.type == 4)
                        {
                            MessageBox.Show("Авторизация успешна");
                            user4 usr = new user4(user);
                            usr.Show(); this.Hide();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Неправельная капча, повторите попытку через 10 секунд.");
                        timer.Start();
                        textBox7.Clear();
                        textBox8.Clear();
                        textBox9.Clear();
                        textBox7.IsEnabled = false;
                        textBox8.IsEnabled = false;
                        textBox9.IsEnabled = false;
                        Capcha();
                    }
                }
                else
                {
                    if (user.type == 1)
                    {
                        MessageBox.Show("Авторизация успешна");
                        User usr = new User(user);
                        usr.Show(); this.Hide();
                    }
                    else if (user.type == 2)
                    {
                        MessageBox.Show("Авторизация успешна");
                        user2 usr = new user2(user);
                        usr.Show(); this.Hide();
                    }
                    else if (user.type == 3)
                    {
                        MessageBox.Show("Авторизация успешна");
                        user3 usr = new user3(user);
                        usr.Show(); this.Hide();
                    }
                    else if (user.type == 4)
                    {
                        MessageBox.Show("Авторизация успешна");
                        user4 usr = new user4(user);
                        usr.Show(); this.Hide();
                    }
                }
               
            }
            else
            {
                MessageBox.Show("Такого пользователя не существует");
                textBox9.Visibility = Visibility.Visible;
                lab1.Visibility = Visibility.Visible;
                imageca.Visibility = Visibility.Visible;
                Capcha();
                stat = stat + 1;
            }
        }
        public int n;
        private void Butpar_Click(object sender, RoutedEventArgs e)
        {
            if(n != 2)
            {
                n++;
                textBox8.FontFamily = new System.Windows.Media.FontFamily("Segoe UI");
            }
            else
            {
                n--;
                textBox8.FontFamily = new System.Windows.Media.FontFamily("Wingdings");
            }
        }


        private void textBox9_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox9.Text.Length > 4) // Укажите нужное количество символов
            {
                textBox9.Text = textBox9.Text.Substring(0, 4); // Ограничиваем количество символов
                textBox9.Select(textBox9.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void textBox7_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox7.Text.Length > 20) // Укажите нужное количество символов
            {
                textBox7.Text = textBox7.Text.Substring(0, 20); // Ограничиваем количество символов
                textBox7.Select(textBox7.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void textBox8_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (textBox8.Text.Length > 15) // Укажите нужное количество символов
            {
                textBox8.Text = textBox8.Text.Substring(0, 15); // Ограничиваем количество символов
                textBox8.Select(textBox8.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }
    }
}
