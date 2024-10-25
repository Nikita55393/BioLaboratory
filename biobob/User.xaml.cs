using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
    /// Логика взаимодействия для User.xaml
    /// </summary>
    public partial class User : Window
    {
        public static string rootPath = AppDomain.CurrentDomain.BaseDirectory;  // Путь к папке Debug
        private User_ user;
        public BiomaterEntities9 db = new BiomaterEntities9();
        public static string imageName = "";    // Имя файла текущего изображения
        public static string imageSource = "";  // Путь к файлу текущего изображения
        private DispatcherTimer timer;
        //private TimeSpan elapsedTime;
        TimeSpan time;
        public User(User_ user)
        {
            InitializeComponent();
            this.user = user;
            //Таймер 2.30.00
            time = TimeSpan.FromMinutes(150);
            var timeFrom1 = new TimeSpan(0, 15, 0);
            var timeFrom2 = new TimeSpan(0, 5, 0);
            timer = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                timerLabel.Content = time.ToString("c");
                if (time == timeFrom1)
                {
                    MessageBox.Show("До окончания сеанса осталось: 15");
                    timer.Start();
                }
                if (time == timeFrom2)
                {
                    MessageBox.Show("До окончания сеанса осталось: 5 минут");
                    timer.Start();
                }
                if (time == TimeSpan.Zero)
                {
                    DateTime date = DateTime.Now;
                    User_ NewUser = db.User_.Where(x => x.id == user.id).FirstOrDefault();
                    NewUser.lastenter = date;
                    db.SaveChanges();
                    MainWindow usr = new MainWindow();
                    usr.Show(); this.Close();
                    timer.Stop();
                }
                time = time.Add(TimeSpan.FromSeconds(-1));
            }, Application.Current.Dispatcher);
            timer.Start();
        }
        //Кнопка назад
        private void back_Click(object sender, RoutedEventArgs e)
        {
            //Сохранение
            timer.Stop();
            DateTime date = DateTime.Now;
            User_ NewUser = db.User_.Where(x => x.id == user.id).FirstOrDefault();
            NewUser.lastenter = date;
            db.SaveChanges();
            MainWindow usr = new MainWindow();
            usr.Show(); this.Close();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            txt1.Text = user.name;
            txt2.Text = user.login;
            txt3.Text = "Лаборант";
            if (user.foto == null)
            {
                image1.Source = new BitmapImage(new Uri(System.IO.Path.GetFullPath(@"..\..\Sourse\laborant_1.jpg") + user.foto));
            }
            else
            {
                string savePath = System.IO.Path.GetFullPath(@"..\..\Sourse\");
                image1.Source = new BitmapImage(new Uri(savePath + user.foto));
            }

            timer.Start();
        }
        
        private void Window_Closed(object sender, EventArgs e)
        {
            timer.Stop();
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            if (timer.IsEnabled)
            {
                timer.Stop();
            }
        }

        private void Window_Deactivated(object sender, EventArgs e)
        {
            if (!timer.IsEnabled)
            {
                timer.Start();
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Otchet ot = new Otchet(user);
            ot.Show();
            this.Hide();
        }

        private void But5_Click(object sender, RoutedEventArgs e)
        {
            Bio bo = new Bio(user);
            bo.Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Person person = new Person(user);
            person.Show();
            this.Hide();
        }
    }
}
