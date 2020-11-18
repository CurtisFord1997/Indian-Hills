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

namespace CheapLoansWPF2
{
    /// <summary>
    /// Interaction logic for ViewData.xaml
    /// </summary>
    public partial class ViewData : Page
    {
        CheapLoansEntities dataEntities = new CheapLoansEntities();
        public ViewData()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            loanDataGrid.ItemsSource = dataEntities.StoredSelect();
        }
    }
}
