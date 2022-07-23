using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using EMSystem.Resources.Data.Models;

namespace EMSystem.Class
{
    class Manager
    {
        public static Frame MainFrame { get; set; }

        public static string UserName;
        public static int UserSchool;
        public static int UserRole;
        public static string UserSchoolName;
        public static int SelectedClass;
    }
}
