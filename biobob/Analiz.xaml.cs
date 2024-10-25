using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using static System.Net.Mime.MediaTypeNames;

namespace biobob
{
    /// <summary>
    /// Логика взаимодействия для Analiz.xaml
    /// </summary>
    public partial class Analiz : Window
    {
        public BiomaterEntities9 db = new BiomaterEntities9();
        private DispatcherTimer timer;
        User_ user;
        private TimeSpan elapsedTime;
        List<Заказ> zz = new List<Заказ>();
        List<Пациент> pasi = new List<Пациент>();
        List<Анализатор> ana = new List<Анализатор>();
        List<Server_> Serv = new List<Server_>();
        

        public Analiz(User_ user)
        {
            InitializeComponent();
            this.user = user;
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += timerTick;
            ana = db.Анализатор.ToList();
            zz = db.Заказ.ToList();
            Serv = db.Server_.ToList();
            pasi = db.Пациент.ToList();
            for (int i = 0; i < pasi.Count; i++)
            {
                cb1.Items.Add(pasi[i].ФИО);
            }
            for (int i = 0; i < zz.Count; i++)
            {
                cb2.Items.Add(zz[i].Код_услуги);
            }
            for (int i = 0; i < ana.Count; i++)
            {
                cb3.Items.Add(ana[i].Наименование);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(cb1 != null && cb2 != null && cb3 != null)
            {
                Пациент pas = db.Пациент.Where(x => x.ФИО == cb1.Text).FirstOrDefault();
                Заказ zza = db.Заказ.Where(x => x.Код_пациента == pas.Код_пациента).FirstOrDefault();
                Services services1 = new Services();
                services1.serviceCode = (int)zza.Код_услуги;

                List<Services> services = new List<Services>();
                services.Add(services1);

                string patient = Convert.ToString(pas.Код_пациента);

                var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:5000/api/analyzer/{cb3.Text}");
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.Method = "POST";

                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    string json = new JavaScriptSerializer().Serialize(new
                    {
                        patient,
                        services
                    });
                    streamWriter.Write(json);
                }
                HttpWebResponse httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                if (httpResponse.StatusCode == HttpStatusCode.OK)
                {
                    MessageBox.Show("Услуги успешно отправлены!");
                    ti = 1;
                    timer.Start();
                }
                else
                {
                    MessageBox.Show("Ошибка отправки!");
                }

            }
            else
            {
                MessageBox.Show("Не все данные введены!");
            }
            
        }
        private void ResetTimer()
        {
            elapsedTime = new TimeSpan(0, 0, 0);
            UpdateTimerLabel();
        }
        private void timerTick(object sender, EventArgs e)
        {
            elapsedTime = elapsedTime.Add(TimeSpan.FromSeconds(1));
            UpdateTimerLabel();
            if (elapsedTime.Hours == 0 && elapsedTime.Minutes == 00 && elapsedTime.Seconds == 30)
            {
                MessageBox.Show("Результат готов!!!");
                timer.Stop();
                ResetTimer();
            }
        }
        private void UpdateTimerLabel()
        {
            timerLabel.Content = string.Format("{0:D2}:{1:D2}:{2:D2}", elapsedTime.Hours, elapsedTime.Minutes, elapsedTime.Seconds);
        }
        public class Services
        {
            public int serviceCode { get; set; }
            public string result { get; set; }
        }
        public class GEtAnalizator
        {
            public string patient { get; set; }
            public List<Services> services { get; set; }
            public int progress { get; set; }
        }
        private void GetInfo()
        {
            GEtAnalizator getanalizator = new GEtAnalizator();
            var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:5000/api/analyzer/{cb3.Text}");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "GET";

            try
            {
                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                if (httpResponse.StatusCode == HttpStatusCode.OK)
                {
                    using (Stream stream = httpResponse.GetResponseStream())
                    {
                        StreamReader reader = new StreamReader(stream);
                        string json = reader.ReadToEnd();
                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        getanalizator = serializer.Deserialize<GEtAnalizator>(json);
                    }
                }
                Пациент pass = db.Пациент.Where(x => x.ФИО == cb1.Text).FirstOrDefault();
                Заказ zak = db.Заказ.Where(x => x.Код_пациента == pass.Код_пациента).FirstOrDefault();
                Server_ se = db.Server_.Where(x => x.Code == zak.Код_услуги).FirstOrDefault();
                Анализатор ani = db.Анализатор.Where(x => x.Наименование == cb3.Text).FirstOrDefault();
                Оказанная_услуга ок = new Оказанная_услуга
                {
                    Код_услуги = zak.Код_заказа,
                    Дата_оказания = DateTime.Now,
                    Код_лаборанта = user.id,
                    Код_анализатора = ani.Код_анализатора,
                    Отчет = Convert.ToString(getanalizator.services[0].result),
                };
                db.Оказанная_услуга.Add(ок);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            user2 poi = new user2(user);
            poi.Show();
            this.Close();
        }
        int ti;
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            if (ti == 1)
            {
                if (elapsedTime.Hours == 0 && elapsedTime.Minutes == 00 && elapsedTime.Seconds == 00)
                {
                    ti = 0;
                    MessageBox.Show("Получите данные!!!");
                    GetInfo();
                }
                else
                {
                    MessageBox.Show("Анализатор не закончил работу");
                }
            }
            else
            {
                MessageBox.Show("Анализатор не запущен!!!");
            }
                
        }

    }
}
