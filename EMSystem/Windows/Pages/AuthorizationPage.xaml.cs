using EMSystem.Class;
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

namespace EMSystem.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
            txtBoxPassword.Visibility = Visibility.Hidden;
        }

        private void BtnAuthorization_Click(object sender, RoutedEventArgs e)
        {
            if (pwdBoxPassword.Password != "")
                txtBoxPassword.Text = pwdBoxPassword.Password;
            
            int counter = 0;
            int id = 0;

            foreach (var user in EMDatabaseEntities.GetContext().User)
            {
                if (txtBoxLogin.Text == user.Login && txtBoxPassword.Text == user.Password)
                {
                    counter++;
                    id = user.Id;
                    var userSchool = EMDatabaseEntities.GetContext().School.ToList().Where(p => p.Id == user.SchoolId);
                    Manager.UserSchool = user.SchoolId;
                    Manager.UserName = user.Name;
                    Manager.UserRole = user.RoleId;
                    foreach (var school in EMDatabaseEntities.GetContext().School.Where(p => p.Id == user.Id))
                    {
                        Manager.UserSchoolName = school.Description;
                    }
                    txtBoxPassword.Text = "";
                    chkBoxVisibility.IsChecked = false;
                    Manager.MainFrame.Navigate(new MainPage());
                    break;
                }
                if (txtBoxLogin.Text == user.Login)
                {
                    id = user.Id;
                }
            }

            if (counter == 0)
            {
                if (id != 0)
                {
                    MessageBox.Show("Вы ввели не верный логин или пароль!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Stop);
                    SaveInformation(id, false);
                }
            }
            else
            {
                SaveInformation(id, true);
            }
            
        }
        private static void SaveInformation(int id, bool successfull)
        {
            LoginHistory loginHistory = new LoginHistory();
            loginHistory.Date = DateTime.Now;
            loginHistory.Successful = successfull;
            loginHistory.UserId = id;
            EMDatabaseEntities.GetContext().LoginHistory.Add(loginHistory);
            EMDatabaseEntities.GetContext().SaveChanges();
        }

        private void chkBoxVisibility_Checked(object sender, RoutedEventArgs e)
        {
            if (chkBoxVisibility.IsChecked == true)
            {
                txtBoxPassword.Text = pwdBoxPassword.Password;
                pwdBoxPassword.Visibility = Visibility.Hidden;
                txtBoxPassword.Visibility = Visibility.Visible;
            }
            
        }

        private void chkBoxVisibility_Unchecked(object sender, RoutedEventArgs e)
        {
            if (chkBoxVisibility.IsChecked == false)
            {
                pwdBoxPassword.Password = txtBoxPassword.Text;
                pwdBoxPassword.Visibility = Visibility.Visible;
                txtBoxPassword.Visibility = Visibility.Hidden;
            }
        }
    }
}
