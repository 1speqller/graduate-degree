using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMSystem.Resources.Data.Models
{
    public partial class Classes
    {
        public string FullClasses
        {
            get
            {
                var fullClasses = $"{Year} {Character}";

                return fullClasses;
            }
        }
    }
}
