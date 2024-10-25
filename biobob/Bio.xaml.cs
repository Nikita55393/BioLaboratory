using Aspose.BarCode.Generation;
using System;
using System.Collections.Generic;
using System.Drawing;
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

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для Bio.xaml
    /// </summary>
    public partial class Bio : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        public User_ user;
        List<Server_> Ser = new List<Server_>();
        List<Пациент> pasi = new List<Пациент>();

        public Bio(User_ user)
        {
            InitializeComponent();
            Ser = db.Server_.ToList();
            this.user = user;
            for (int i = 0; i < Ser.Count; i++)
            {
                Combo.Items.Add(Ser[i].Service);
            }
            pasi = db.Пациент.ToList();
            this.user = user;
            for (int i = 0; i < pasi.Count; i++)
            {
                Combpa.Items.Add(pasi[i].ФИО);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (tex1.Text != "" && tex2.Text != "" && Combo != null && Combpa != null)
            {
                
                    Random rnd = new Random();
                    System.Drawing.Image image = null;
                    BarcodeLib.Barcode b = new BarcodeLib.Barcode();
                    b.Height = 100;
                    b.Width = 200;
                    if (tex3.Text == "")
                    {
                        int numer = rnd.Next(100000, 999999);
                        image = b.Encode(BarcodeLib.TYPE.CODE128C, Convert.ToString(numer));
                        image.Save(@"..\..\Sav\" + numer + "generate-barcode.pdf");
                        BarcodeGenerator generator = new BarcodeGenerator(EncodeTypes.Code128, "Aspose.BarCode");

                        // установить разрешение
                        generator.Parameters.Resolution = 400;

                        // сгенерировать штрих-код
                        generator.Save("generate-barcode.pdf");
                        Server_ servis = db.Server_.Where(x => x.Service == Combo.Text).FirstOrDefault();
                        Пациент pasient = db.Пациент.Where(x => x.ФИО == Combpa.Text).FirstOrDefault();
                        Заказ заказ = new Заказ
                        {
                            Код_услуги = servis.Code,
                            Дата_создания = DateTime.Now,
                            Код_пациента = pasient.Код_пациента,
                            Статус_услуги = tex1.Text,
                            Статус_заказа = tex2.Text,
                        };
                        db.Заказ.Add(заказ);
                        db.SaveChanges();
                        Биоматериал biom = new Биоматериал
                        {
                            Код_штрихкода = numer
                        };
                        db.Биоматериал.Add(biom);
                        db.SaveChanges();
                        MessageBox.Show("Отчет составлен");
                        string saveP = System.IO.Path.GetFullPath(@"C:\Users\usersql\Desktop\UP\biobob\Sav\");
                        imgsh.Source = new BitmapImage(new Uri(saveP + numer + "generate-barcode.pdf"));
                    }
                    else
                    {
                        if (tex3.Text.Length < 6)
                        {
                            MessageBox.Show("Введите 6 цифр!");
                            // Можно также блокировать ввод новых символов, установив textBox.IsReadOnly = true;
                        }
                        else
                        {
                            string textBoxValue = tex3.Text;

                            // Попытка преобразовать текст в int
                            if (int.TryParse(textBoxValue, out int numer))
                            {
                                // Значение numer преобразовано.
                            }
                            image = b.Encode(BarcodeLib.TYPE.CODE128C, Convert.ToString(numer));
                            image.Save(@"..\..\Sav\" + numer + "generate-barcode.pdf");
                            BarcodeGenerator generator = new BarcodeGenerator(EncodeTypes.Code128, "Aspose.BarCode");

                            // установить разрешение
                            generator.Parameters.Resolution = 400;

                            // сгенерировать штрих-код
                            generator.Save("generate-barcode.pdf");
                            Server_ servis = db.Server_.Where(x => x.Service == Combo.Text).FirstOrDefault();
                            Пациент pasient = db.Пациент.Where(x => x.ФИО == Combpa.Text).FirstOrDefault();
                            Заказ заказ = new Заказ
                            {
                                Код_услуги = servis.Code,
                                Дата_создания = DateTime.Now,
                                Код_пациента = pasient.Код_пациента,
                                Статус_услуги = tex1.Text,
                                Статус_заказа = tex2.Text,
                            };
                            db.Заказ.Add(заказ);
                            db.SaveChanges();
                            Биоматериал biom = new Биоматериал
                            {
                                Код_штрихкода = numer
                            };
                            db.Биоматериал.Add(biom);
                            db.SaveChanges();
                            MessageBox.Show("Отчет составлен");
                            string saveP = System.IO.Path.GetFullPath(@"C:\Users\usersql\Desktop\UP\biobob\Sav\");
                            imgsh.Source = new BitmapImage(new Uri(saveP + numer + "generate-barcode.pdf"));
                        }
                        
                    }
            }
            else
            {
                MessageBox.Show("Не все поля заполнены!");
            }
            
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Person per = new Person(user);
            per.Show();
            this.Close();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            User oi = new User(user);  
            oi.Show();
            this.Close();
        }

        private void tex3_PreviewTextInput(object sender, TextCompositionEventArgs e)
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

            if (tex3 != null && tex3.Text.Length >= maxLength)
            {
                e.Handled = true; // Отменить ввод, если достигнуто максимальное количество символов
            }
            else if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true; // Отменить ввод, если введенный символ не является цифрой
            }
        }

        private void tex1_PreviewTextInput(object sender, TextCompositionEventArgs e)
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

        private void tex2_PreviewTextInput(object sender, TextCompositionEventArgs e)
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

        private void tex3_TextChanged(object sender, TextChangedEventArgs e)
        {
        }

        private void tex1_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (tex1.Text.Length > 15) // Укажите нужное количество символов
            {
                tex1.Text = tex1.Text.Substring(0, 15); // Ограничиваем количество символов
                tex1.Select(tex1.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }

        private void tex2_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (tex2.Text.Length > 15) // Укажите нужное количество символов
            {
                tex2.Text = tex2.Text.Substring(0, 15); // Ограничиваем количество символов
                tex2.Select(tex2.Text.Length, 0); // Перемещаем курсор в конец текста
            }
        }
    }
}
