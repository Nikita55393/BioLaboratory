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
using System.Windows.Threading;

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для adm.xaml
    /// </summary>
    public partial class adm : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        public User_ user;
        List<User_> zak = new List<User_>();
        public adm(User_ user)
        {
            InitializeComponent();
            this.user = user;
            zak = db.User_.ToList();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ListV.ItemsSource = zak;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            user4 kj = new user4(user);
            kj.Show();
            this.Close();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            //string keyword = txtSearch.Text.ToLower();

            //foreach (ListViewItem item in ListV.Items)
            //{
            //    if (item.Text.ToLower().Contains(keyword))
            //    {
            //        item.Selected = true;
            //        item.EnsureVisible();
            //    }
            //    else
            //    {
            //        item.Selected = false;
            //    }
            //}
        }
    }
}
