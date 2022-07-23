using EMSystem.Class;
using EMSystem.Windows.Pages;
using System;
using System.Windows;

namespace EMSystem
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new AuthorizationPage());
            Manager.MainFrame = MainFrame;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack)
                Manager.MainFrame.GoBack();
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                btnBack.Visibility = Visibility.Visible;
                btnClassInfo.Visibility = Visibility.Visible;
                btnLoginHistory.Visibility = Visibility.Visible;
                btnOrder.Visibility = Visibility.Visible;
                btnSchoolInfo.Visibility = Visibility.Visible;
                btnStudentsInfo.Visibility = Visibility.Visible;
                btnUser.Visibility = Visibility.Visible;
                btnBeneficiary.Visibility = Visibility.Visible;
            }
                
            else
            {
                btnBack.Visibility = Visibility.Hidden;
                btnClassInfo.Visibility = Visibility.Hidden;
                btnLoginHistory.Visibility = Visibility.Hidden;
                btnOrder.Visibility = Visibility.Hidden;
                btnSchoolInfo.Visibility = Visibility.Hidden;
                btnStudentsInfo.Visibility = Visibility.Hidden;
                btnUser.Visibility = Visibility.Hidden;
                btnBeneficiary.Visibility = Visibility.Hidden;
            }

            if (Manager.UserRole == 2)
            {
                btnLoginHistory.Visibility = Visibility.Hidden;
                btnUser.Visibility = Visibility.Hidden;
                btnSchoolInfo.Visibility = Visibility.Hidden;
            }
        }

        private void btnSchoolInfo_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new SchoolPage());
        }

        private void btnClassInfo_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ClassInfoPage());
        }

        private void btnStudentsInfo_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new StudentsPage());
        }

        private void btnOrder_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new OrderPage());
        }

        private void btnLoginHistory_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new LoginHistoryPage());
        }

        private void btnUser_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new UserPage());
        }

        private void btnBeneficiary_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new BeneficiaryInfoPage());
        }
    }
}
