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
    /// Логика взаимодействия для BeneficiaryInfoPage.xaml
    /// </summary>
    public partial class BeneficiaryInfoPage : Page
    {
        public BeneficiaryInfoPage()
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
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Beneficiary beneficiary = (Beneficiary)DGridBeneficiaryInfo.SelectedItem;
            Manager.MainFrame.Navigate(new EditBeneficiaryPage(beneficiary));
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
                DGridBeneficiaryInfo.ItemsSource = EMDatabaseEntities.GetContext().Beneficiary.ToList().Where(p => p.Classes == selectedClass);
            }
        }

        private void btnAddBeneficiary_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddBeneficiaryPage());
        }

        private void btnDeleteBeneficiary_Click(object sender, RoutedEventArgs e)
        {
            var productForRemoving = DGridBeneficiaryInfo.SelectedItems.Cast<Beneficiary>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {productForRemoving.Count()} элементов?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    EMDatabaseEntities.GetContext().Beneficiary.RemoveRange(productForRemoving);
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
