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
    
    public partial class Услуги_лаб
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Услуги_лаб()
        {
            this.Оказанная_услуга = new HashSet<Оказанная_услуга>();
        }
    
        public int Код_услуги { get; set; }
        public int Код_наименования { get; set; }
        public Nullable<int> Стоимость { get; set; }
        public Nullable<System.DateTime> Срок_выполнения { get; set; }
        public int Среднее_отклонение { get; set; }
    
        public virtual Server_ Server_ { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Оказанная_услуга> Оказанная_услуга { get; set; }
    }
}
