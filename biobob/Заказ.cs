//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace biobob
{
    using System;
    using System.Collections.Generic;
    
    public partial class Заказ
    {
        public int Код_заказа { get; set; }
        public Nullable<System.DateTime> Дата_создания { get; set; }
        public Nullable<int> Код_услуги { get; set; }
        public string Статус_услуги { get; set; }
        public string Статус_заказа { get; set; }
        public Nullable<int> Время_выполнения { get; set; }
        public Nullable<int> Код_биоматериала { get; set; }
        public Nullable<int> Код_пациента { get; set; }
    
        public virtual Server_ Server_ { get; set; }
        public virtual Биоматериал Биоматериал { get; set; }
        public virtual Пациент Пациент { get; set; }
    }
}
