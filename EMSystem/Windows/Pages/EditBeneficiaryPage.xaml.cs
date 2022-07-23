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
    /// Логика взаимодействия для EditBeneficiaryPage.xaml
    /// </summary>
    /// 
    public partial class EditBeneficiaryPage : Page
    {
        private Beneficiary AddBeneficiary;
        public EditBeneficiaryPage(Beneficiary beneficiary)
        {
            InitializeComponent();

            AddBeneficiary = new Beneficiary();
            if (beneficiary != null)
                AddBeneficiary = beneficiary;

            DataContext = AddBeneficiary;
        }

        private void btnEditBeneficiary_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(AddBeneficiary.FirstName))
            {
                stringBuilder.AppendLine("Не введена фамилия");
            }
            if (string.IsNullOrEmpty(AddBeneficiary.LastName))
            {
                stringBuilder.AppendLine("Не введена имя");
            }

            if (datepickCertificate.SelectedDate == null)
            {
                stringBuilder.AppendLine("Не выбрана дата окончания сертификата");
            }

            if (string.IsNullOrEmpty(AddBeneficiary.Patronymic))
            {
                stringBuilder.AppendLine("Не введено отчество");
            }

            if (stringBuilder.Length != 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            try
            {
                EMDatabaseEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка" + ex.Message.ToString());
            }
        }

        private void cmbBoxBeneficiaryType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void cmbBoxClass_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
