using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using EMSystem.Class;
using EMSystem.Resources.Data.Models;

namespace EMSystem.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrderPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        public OrderPage()
        {
            InitializeComponent();
            txtTitle.Text = "Свод на " + DateTime.Now.ToShortDateString();
        }

        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            PrintDialog printDialog = new PrintDialog();
            if (printDialog.ShowDialog() == true)
            {
                IDocumentPaginatorSource idpSource = flowDocumentService;
                printDialog.PrintDocument(idpSource.DocumentPaginator, $"Report_From_{DateTime.Now.ToShortDateString()}");
                Manager.MainFrame.GoBack();
            }
        }

        private void btnAll_Click(object sender, RoutedEventArgs e)
        {
            if (Manager.UserRole == 2)
            {
                List<OrderStudentsClass> content = new List<OrderStudentsClass>();
                foreach (int classNum in Enumerable.Range(1, 11))
                {
                    int counter = 0;
                    OrderStudentsClass orders = new OrderStudentsClass();
                    foreach (CountStudents count in EMDatabaseEntities.GetContext().CountStudents.Where(p => p.Classes.School.Id == Manager.UserSchool).OrderBy(x => x.Classes.Year).ToList())
                    {
                        if (count.Classes.Year == classNum)
                        {
                            if (counter == 0)
                            {
                                orders = new OrderStudentsClass().fromCountStudent(count);
                            }
                            else
                            {
                                orders.ManyChildren += count.ManyChildren;
                                orders.LowIncome += count.LowIncome;
                                orders.Invalid += count.Invalid;
                                orders.Orphan += count.Orphan;
                                orders.OVZ += count.OVZ;
                                orders.InHomeOVZ += count.InHomeOVZ;
                                orders.InHomeNoStatus += count.InHomeNoStatus;
                                orders.InHomeInvalid += count.InHomeInvalid;
                                orders.InFeedingParents += count.InFeedingParents;
                                orders.NoType += count.NoType;
                                orders.AllStudents += count.AllStudents;
                            }
                            counter++;
                        }
                    }
                    if (counter != 0)
                        content.Add(orders);
                }
                DGridBeneficiaryInfo.ItemsSource = content;
            }

            else if (Manager.UserRole == 1)
            {
                List<OrderStudentsClass> content = new List<OrderStudentsClass>();
                foreach (int classNum in Enumerable.Range(1, 11))
                {
                    int counter = 0;
                    OrderStudentsClass orders = new OrderStudentsClass();
                    foreach (CountStudents count in EMDatabaseEntities.GetContext().CountStudents.OrderBy(x => x.Classes.Year).ToList())
                    {
                        if (count.Classes.Year == classNum)
                        {
                            if (counter == 0)
                            {
                                orders = new OrderStudentsClass().fromCountStudent(count);
                            }
                            else
                            {
                                orders.ManyChildren += count.ManyChildren;
                                orders.LowIncome += count.LowIncome;
                                orders.Invalid += count.Invalid;
                                orders.Orphan += count.Orphan;
                                orders.OVZ += count.OVZ;
                                orders.InHomeOVZ += count.InHomeOVZ;
                                orders.InHomeNoStatus += count.InHomeNoStatus;
                                orders.InHomeInvalid += count.InHomeInvalid;
                                orders.InFeedingParents += count.InFeedingParents;
                                orders.NoType += count.NoType;
                                orders.AllStudents += count.AllStudents;
                            }
                            counter++;
                        }
                    }
                    if (counter != 0)
                        content.Add(orders);
                }
                DGridBeneficiaryInfo.ItemsSource = content;
            }
        }
    }
}
