//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace School_DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class FacultySubject
    {
        public int faculty_subject_id { get; set; }
        public int faculty_id { get; set; }
        public int subject_id { get; set; }
    
        public virtual Faculty Faculty { get; set; }
        public virtual Subject Subject { get; set; }
    }
}
