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
using static System.Net.Mime.MediaTypeNames;
using System.Windows.Threading;

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для Prosmotr.xaml
    /// </summary>
    public partial class Prosmotr : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        List<Заказ> zak = new List<Заказ>();
        private User_ user;

        public Prosmotr(User_ user)
        {
            InitializeComponent();
            this.user = user;
            zak = db.Заказ.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ListView.ItemsSource = zak;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            user3 u = new user3(user);
            u.Show();
            this.Close();
        }
    }

}

