using System;
using System.Collections.Generic;
using System.Data;
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
    /// Логика взаимодействия для user2.xaml
    /// </summary>
    public partial class user2 : Window
    {
        public static string rootPath = AppDomain.CurrentDomain.BaseDirectory;  // Путь к папке Debug
        private User_ user;
        public BiomaterEntities9 db = new BiomaterEntities9();
        public static string imageName = "";    // Имя файла текущего изображения
        public static string imageSource = "";  // Путь к файлу текущего изображения
        private DispatcherTimer timer;
        //private TimeSpan elapsedTime;
        TimeSpan time;
        public user2(User_ user)
        {
            InitializeComponent();
            this.user = user;
            //timer = new DispatcherTimer();
            //timer.Interval = TimeSpan.FromSeconds(1);
            //timer.Tick += timerTick;
            time = TimeSpan.FromMinutes(150);
            var timeFrom1 = new TimeSpan(0, 15, 0);
            var timeFrom2 = new TimeSpan(0, 5, 0);
            timer = new DispatcherTimer(new TimeSpan(0, 0, 1), DispatcherPriority.Normal, delegate
            {
                timerLabel.Content = time.ToString("c");
                if (time == timeFrom1)
                {
                    MessageBox.Show("До окончания сеанса осталось: 15 минут");
                }
                if (time == timeFrom2)
                {
                    MessageBox.Show("До окончания сеанса осталось: 5 минут");
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

        private void back_Click(object sender, RoutedEventArgs e)
        {
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
            txt3.Text = "Лаборант-исследователь";
            if(user.foto == null)
            {
                image1.Source = new BitmapImage(new Uri(System.IO.Path.GetFullPath(@"..\..\Sourse\laborant_2.jpg") + user.foto));
            }
            else
            {
                string savePath = System.IO.Path.GetFullPath(@"..\..\Sourse\");
                image1.Source = new BitmapImage(new Uri(savePath + user.foto));
            }
            
            //elapsedTime = TimeSpan.Zero;
            //UpdateTimerLabel();

            timer.Start();
        }
        //private void timerTick(object sender, EventArgs e)
        //{
        //    elapsedTime = elapsedTime.Add(TimeSpan.FromSeconds(1));
        //    UpdateTimerLabel();
        //    if (elapsedTime.Hours == 0 && elapsedTime.Minutes == 00 && elapsedTime.Seconds == 5)
        //    {
        //        MessageBox.Show("Осталось всего 15 минут до окончания сеанса!");
        //        timer.Start();
        //    }
        //    if (elapsedTime.Hours == 0 && elapsedTime.Minutes == 00 && elapsedTime.Seconds == 10)
        //    {
        //        DateTime date = DateTime.Now;
        //        User_ NewUser = db.User_.Where(x => x.id == user.id).FirstOrDefault();
        //        NewUser.lastenter = date;
        //        db.SaveChanges();
        //        MainWindow window = new MainWindow();
        //        window.Show();
        //        this.Close();
        //    }
        //}
        //private void UpdateTimerLabel()
        //{
        //    timerLabel.Content = string.Format("{0:D2}:{1:D2}:{2:D2}", elapsedTime.Hours, elapsedTime.Minutes, elapsedTime.Seconds);
        //}
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
            Analiz an = new Analiz(user);
            an.Show();
            this.Hide();
        }
    }
}
