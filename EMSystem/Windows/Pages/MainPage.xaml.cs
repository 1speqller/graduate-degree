using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using EMSystem.Resources.Data.Models;
using EMSystem.Class;

namespace EMSystem.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
            var school = EMDatabaseEntities.GetContext().School.ToList().Where(p => p.Id == Manager.UserSchool);

            txtBlockUserName.Text = Manager.UserName;

            if (Manager.UserSchool != 23)
                txtBlockUserSchool.Text += Manager.UserSchoolName;

            else
                txtBlockUserSchool.Text = "Администратор";
        }
    }
}
