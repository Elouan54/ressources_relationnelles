import 'package:flutter/material.dart';
import 'package:ressources_relationnelles/screens/profil.dart';

class MenuBas extends StatefulWidget {
  const MenuBas({super.key, required this.indexSelect});
  final int indexSelect;

  @override
  State<MenuBas> createState() => _MenuBasState();
}

class _MenuBasState extends State<MenuBas> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.indexSelect;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: Colors.black,
      selectedItemColor: const Color.fromARGB(255, 3, 152, 158),
      unselectedItemColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Ressources',
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profil',
          backgroundColor: Colors.lime,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => getPageWidget(),
        ));
  }

  getPageWidget() {
    if (_selectedIndex == 0) {
      //return const RessourcesMaster();
    } else if (_selectedIndex == 1) {
      return const Profil();
    }
  }
}
