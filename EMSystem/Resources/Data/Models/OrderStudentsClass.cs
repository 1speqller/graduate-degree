using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMSystem.Resources.Data.Models
{
    class OrderStudentsClass
    {
        public int ClassId { get; set; }
        public int ManyChildren { get; set; }
        public int LowIncome { get; set; }
        public int Invalid { get; set; }
        public int Orphan { get; set; }
        public int OVZ { get; set; }
        public int InHomeOVZ { get; set; }
        public int InHomeInvalid { get; set; }
        public int InHomeNoStatus { get; set; }
        public int InFeedingParents { get; set; }
        public int NoType { get; set; }
        public int AllStudents { get; set; }
        public string ClassName { get; set; }

        public OrderStudentsClass fromCountStudent(CountStudents countStudent)
        {
            return new OrderStudentsClass()
            {
                ClassId = countStudent.ClassId,
                ManyChildren = countStudent.ManyChildren,
                LowIncome = countStudent.LowIncome,
                Invalid = countStudent.Invalid,
                Orphan = countStudent.Orphan,
                OVZ = countStudent.OVZ,
                InHomeOVZ = countStudent.InHomeOVZ,
                InHomeNoStatus = countStudent.InHomeNoStatus,
                InHomeInvalid = countStudent.InHomeInvalid,
                InFeedingParents = countStudent.InFeedingParents,
                NoType = countStudent.NoType,
                AllStudents = countStudent.AllStudents,
                ClassName = countStudent.Classes.Year + " классы"
            };
        }
    }
}
