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
    /// Логика взаимодействия для StudentsPage.xaml
    /// </summary>
    public partial class StudentsPage : Page
    {
        public StudentsPage()
        {
            InitializeComponent();
            if (Manager.UserRole != 1)
            {
                cmbBoxSchool.Visibility = Visibility.Hidden;
                cmbBoxClass.ItemsSource = EMDatabaseEntities.GetContext().Classes.ToList().Where(p => p.SchoolId == Manager.UserSchool);
                cmbBoxClass.SelectedIndex = 0;
            }
            else
            {
                cmbBoxSchool.ItemsSource = EMDatabaseEntities.GetContext().School.ToList().Where(p => p.Number != 1000);
                cmbBoxSchool.SelectedIndex = 0;
                btnAddStudents.Visibility = Visibility.Hidden;
                btnDeleteStudents.Visibility = Visibility.Hidden;
            }                
        }

        private void cmbBoxSchool_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedSchool = cmbBoxSchool.SelectedItem as School;
            if (selectedSchool != null)
            {
                cmbBoxClass.ItemsSource = EMDatabaseEntities.GetContext().Classes.ToList().Where(p => p.School == selectedSchool);
                cmbBoxClass.SelectedIndex = 0;
            }
        }
        private void cmbBoxClass_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedClass = cmbBoxClass.SelectedItem as Classes;

            if (selectedClass != null)
            {
                Manager.SelectedClass = selectedClass.Id;
                DGridStudentsInfo.ItemsSource = EMDatabaseEntities.GetContext().CountStudents.ToList().Where(p => p.Classes == selectedClass);
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new EditStudentsPage());
        }

        private void btnAddStudents_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddStudentsPage());
        }

        private void btnDeleteStudents_Click(object sender, RoutedEventArgs e)
        {
            var studentsForRemoving = DGridStudentsInfo.SelectedItems.Cast<Students>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {studentsForRemoving.Count()} элементов?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    EMDatabaseEntities.GetContext().Students.RemoveRange(studentsForRemoving);
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
