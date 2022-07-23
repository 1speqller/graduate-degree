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
using EMSystem.Class;
using EMSystem.Resources.Data.Models;

namespace EMSystem.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для ClassInfoPage.xaml
    /// </summary>
    public partial class ClassInfoPage : Page
    {
        public ClassInfoPage()
        {
            InitializeComponent();
            if (Manager.UserRole != 1)
            {
                cmbBoxAdminClasses.Visibility = Visibility.Hidden;
                DGridClassInfo.ItemsSource = EMDatabaseEntities.GetContext().Classes.ToList().Where(p => p.SchoolId == Manager.UserSchool);
            }
                
            else
            {
                cmbBoxAdminClasses.ItemsSource = EMDatabaseEntities.GetContext().School.ToList().Where(p => p.Number != 1000);
                cmbBoxAdminClasses.SelectedIndex = 0;
                btnAddClasses.Visibility = Visibility.Hidden;
                btnDeleteClasses.Visibility = Visibility.Hidden;
            }
        }
        private void cmbBoxAdminClasses_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedSchool = cmbBoxAdminClasses.SelectedItem as School;
            if (selectedSchool != null)
            {
                DGridClassInfo.ItemsSource = EMDatabaseEntities.GetContext().Classes.ToList().Where(p => p.School == selectedSchool);
            }
        }

        private void btnDeleteClasses_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnAddClasses_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnEditClass_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
