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

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для Otchet.xaml
    /// </summary>
    public partial class Otchet : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        public List<Server_> Ser = new List<Server_>();
        private User_ user;
        public Otchet(User_ user)
        {
            InitializeComponent();
            this.user = user;
            Ser = db.Server_.ToList();
            for(int i =0; i < Ser.Count; i++)
            {
                Cb1.Items.Add(Ser[i].Service);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Server_ servis = db.Server_.Where(x => x.Service == Cb1.Text).FirstOrDefault(); 
            Заказ заказ = new Заказ
            {
                Дата_создания = DateTime.Now,
                Код_услуги = servis.Code,
                Статус_услуги = txt10.Text,
                Статус_заказа = txt11.Text,
            };
            db.Заказ.Add(заказ); 
            db.SaveChanges();
            MessageBox.Show("Отчет составлен");
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            User o = new User(user);
            o.Show(); this.Close();
        }

        private void txt10_PreviewTextInput(object sender, TextCompositionEventArgs e)
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

        private void txt11_PreviewTextInput(object sender, TextCompositionEventArgs e)
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
    }
}
