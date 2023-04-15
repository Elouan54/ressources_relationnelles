import 'package:ressources_relationnelles/screens/profil.dart';
import 'package:ressources_relationnelles/screens/ressource.dart';
import 'package:flutter/material.dart';

class PrincipalMaster extends StatefulWidget {
  const PrincipalMaster({super.key});

  @override
  State<PrincipalMaster> createState() => _PrincipalMasterState();
}

class _PrincipalMasterState extends State<PrincipalMaster> {
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final listeLiens = [
      const Ressource(),
      const Profil(),
    ];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        title: Column(
          children: <Widget>[
            Image.asset("assets/logo.png", width: 100, height: 100),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 3, 152, 158), //03989E
        //automaticallyImplyLeading: false,
      ),
      body: listeLiens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color.fromARGB(255, 3, 152, 158),
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Ressources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
