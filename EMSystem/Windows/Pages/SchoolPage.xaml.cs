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
using EMSystem.Windows.Pages;

namespace EMSystem.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для SchoolPage.xaml
    /// </summary>
    public partial class SchoolPage : Page
    {
        public SchoolPage()
        {
            InitializeComponent();
            DGridSchool.ItemsSource = EMDatabaseEntities.GetContext().School.ToList().Where(p => p.Number != 1000);
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new EgitSchoolPage());
        }

        private void btnAddSchool_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddSchoolPage());
        }
        private void btnDeleteSchool_Click(object sender, RoutedEventArgs e)
        {
            var schoolForRemoving = DGridSchool.SelectedItems.Cast<School>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {schoolForRemoving.Count()} элементов?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    EMDatabaseEntities.GetContext().School.RemoveRange(schoolForRemoving);
                    EMDatabaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены");

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }
    }
}
