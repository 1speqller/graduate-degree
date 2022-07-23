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
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();
            DGridUser.ItemsSource = EMDatabaseEntities.GetContext().User.ToList();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new EditUserPage());
        }

        private void btnAddUser_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddUserPage());
        }

        private void btnDeleteUser_Click(object sender, RoutedEventArgs e)
        {
            var userForRemoving = DGridUser.SelectedItems.Cast<User>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {userForRemoving.Count()} элементов?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    EMDatabaseEntities.GetContext().User.RemoveRange(userForRemoving);
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
