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
    
    public partial class Пациент
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Пациент()
        {
            this.Заказ = new HashSet<Заказ>();
        }
    
        public int Код_пациента { get; set; }
        public string ФИО { get; set; }
        public Nullable<System.DateTime> Дата_рождения { get; set; }
        public Nullable<int> Код_паспорта { get; set; }
        public string Телефон { get; set; }
        public string email { get; set; }
        public Nullable<int> Код_полиса { get; set; }
        public int Код_страховой { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Заказ> Заказ { get; set; }
        public virtual Паспорт Паспорт { get; set; }
        public virtual Полис Полис { get; set; }
        public virtual Страховая Страховая { get; set; }
    }
}
