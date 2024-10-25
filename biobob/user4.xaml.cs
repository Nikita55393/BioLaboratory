﻿using System;
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
using System.Windows.Threading;

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для user4.xaml
    /// </summary>
    public partial class user4 : Window
    {
        public static string rootPath = AppDomain.CurrentDomain.BaseDirectory;  // Путь к папке Debug
        private User_ user;
        public BiomaterEntities9 db = new BiomaterEntities9();
        public static string imageName = "";    // Имя файла текущего изображения
        public static string imageSource = "";  // Путь к файлу текущего изображения
        public user4(User_ user)
        {
            InitializeComponent();
            this.user = user;
        }

        private void back_Click(object sender, RoutedEventArgs e)
        {
            MainWindow usr = new MainWindow();
            usr.Show(); this.Hide();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            txt1.Text = user.name;
            txt2.Text = user.login;
            txt3.Text = "Администратор";
            string savePath = System.IO.Path.GetFullPath(@"..\..\Sourse\");
            image1.Source = new BitmapImage(new Uri(savePath + user.foto));
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            adm ad = new adm(user);
            ad.Show(); 
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            adm2 ad = new adm2(user);
            ad.Show();
            this.Hide();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Log lg = new Log(user);
            lg.Show();
            this.Hide();
        }
    }
}
