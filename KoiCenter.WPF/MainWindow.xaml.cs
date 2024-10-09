using KoiCenter.WPF.Models;
using System.Windows;

namespace KoiCenter.WPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenterContext _context;

        public MainWindow()
        {
            InitializeComponent();
            _context = new FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenterContext();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            lvPets.ItemsSource = _context.Pets.ToList();
        }
    }


}