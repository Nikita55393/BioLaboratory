using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
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
    /// Логика взаимодействия для adm2.xaml
    /// </summary>
    public partial class adm2 : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        public User_ user;
        List<Server_> Ser = new List<Server_>();
        public adm2(User_ user)
        {
            InitializeComponent();
            Ser = db.Server_.ToList();
            this.user = user;
            for (int i = 0; i < Ser.Count; i++)
            {
                Combo.Items.Add(Ser[i].Service);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Server_ servis = db.Server_.Where(x => x.Service == Combo.Text).FirstOrDefault();
            Заказ заказ = new Заказ
            {
                Дата_создания = DateTime.Now,
                Код_услуги = servis.Code,
                Статус_услуги = textb1.Text,
                Статус_заказа = textb2.Text,
            };
            db.Заказ.Add(заказ);
            db.SaveChanges();
            MessageBox.Show("Отчет составлен");
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            user4 kj = new user4(user);
            kj.Show();
            this.Close();
        }

        private void textb1_PreviewTextInput(object sender, TextCompositionEventArgs e)
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

        private void textb2_PreviewTextInput(object sender, TextCompositionEventArgs e)
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
