using System;
using System.Collections;
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

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для Stra.xaml
    /// </summary>
    public partial class Stra : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        public User_ user;
        List<Страховая> st = new List<Страховая>();
        public Stra(User_ user)
        {
            InitializeComponent();
            this.user = user;
            st = db.Страховая.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            List.ItemsSource = st;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            user3 dh = new user3(user);
            dh.Show();
            this.Close();
        }
    }
}
