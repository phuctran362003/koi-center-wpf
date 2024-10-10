using KoiCenter.WPF.Models;
using Microsoft.EntityFrameworkCore;
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
            // Eager load PetType when retrieving Pets
            lvPets.ItemsSource = _context.Pets
                .Include(p => p.PetType)  // Eagerly load the related PetType
                .Include(p => p.Owner)  // Eagerly load the related PetType
                .ToList();

            cbPetType.ItemsSource = _context.PetTypes.Select(pt => pt.GeneralType).Distinct().ToList();
            cbOwner.ItemsSource = _context.Users.Select(pt => pt.Username).Distinct().ToList();
            cbHealthStatus.ItemsSource = new List<string> { "Healthy", "Sick", "Recovering" };



        }



    }


}