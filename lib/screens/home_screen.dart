
import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/entities/product.dart';
import 'package:mercadinho_jamp/entities/sale.dart';
import 'package:mercadinho_jamp/screens/debtors_screen.dart';
import 'package:mercadinho_jamp/screens/list_screen.dart';
import 'package:mercadinho_jamp/screens/products_screen.dart';
import 'package:mercadinho_jamp/screens/sales_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    SalesScreen(),
    ProductsScreen(),
    DebtorsScreen()
  ];

  int _currentPageIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(currentIndex: _currentPageIndex, onTap: _onItemSelected,),
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _screens[_currentPageIndex],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor = theme.colorScheme.primary;
    final barItemsColor = Colors.yellow;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: barColor,
      enableFeedback: false,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      selectedItemColor: barItemsColor,
      // Cor do ícone e texto selecionados
      unselectedItemColor: Colors.white,
      // Cor do ícone e texto não selecionados
      selectedLabelStyle: TextStyle(color: barItemsColor, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(color: Colors.white),
      selectedIconTheme: IconThemeData(color: barItemsColor, size: 30),
      unselectedIconTheme: const IconThemeData(color: Colors.white),
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.attach_money,
          ),
          label: 'Vendas',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_alt,
          ),
          label: 'Produtos',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Devedores',
        ),
      ],
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      automaticallyImplyLeading: false,
      title: Text("Mercadinho Jamp", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
    );
  }
}