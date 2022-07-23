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
    /// Логика взаимодействия для AddBeneficiaryPage.xaml
    /// </summary>
    public partial class AddBeneficiaryPage : Page
    {
        int typeId;
        int classId;
        int certificateId;
        public AddBeneficiaryPage()
        {
            InitializeComponent();
            cmbBoxClass.ItemsSource = EMDatabaseEntities.GetContext().Classes.ToList().Where(p => p.SchoolId == Manager.UserSchool);
            cmbBoxClass.SelectedIndex = 0;

            cmbBoxBeneficiaryType.ItemsSource = EMDatabaseEntities.GetContext().BeneficiaryType.ToList();
            cmbBoxBeneficiaryType.SelectedIndex = 0;
        }

        private void cmbBoxBeneficiaryType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedType = cmbBoxBeneficiaryType.SelectedItem as BeneficiaryType;
            typeId = selectedType.Id;
        }

        private void cmbBoxClass_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedClass = cmbBoxClass.SelectedItem as Classes;
            classId = selectedClass.Id;
        }

        private void btnAddBeneficiary_Click(object sender, RoutedEventArgs e)
        {
            if (datepickCertificate.Text != "" && txtBoxCertificateName.Text != "" && txtBoxFirstName.Text != "" && txtBoxLastName.Text != "" && txtBoxPatronomyc.Text != "" && datepickCertificate.SelectedDate != null)
            {
                try
                {
                    Certificate certificate = new Certificate();
                    certificate.Name = txtBoxCertificateName.Text;
                    certificate.Date = datepickCertificate.SelectedDate.Value;
                    EMDatabaseEntities.GetContext().Certificate.Add(certificate);
                    EMDatabaseEntities.GetContext().SaveChangesAsync();
                    certificateId = certificate.Id;

                    Beneficiary beneficiary = new Beneficiary();
                    beneficiary.FirstName = txtBoxFirstName.Text;
                    beneficiary.LastName = txtBoxLastName.Text;
                    beneficiary.Patronymic = txtBoxPatronomyc.Text;
                    beneficiary.TypeId = typeId;
                    beneficiary.ClassesId = classId;
                    beneficiary.CertificateId = certificateId;
                    EMDatabaseEntities.GetContext().Beneficiary.Add(beneficiary);
                    EMDatabaseEntities.GetContext().SaveChangesAsync();

                    MessageBox.Show("Данные успшено добавлены!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    Manager.MainFrame.GoBack();
                }
                catch
                {
                    MessageBox.Show("Ошибка с записью значений!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }

            }
            else
            {
                MessageBox.Show("Вы ввели неверные или пустые значения!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
