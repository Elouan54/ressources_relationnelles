import 'package:flutter/material.dart';
import 'package:ressources_relationnelles/screens/profil.dart';
import 'package:ressources_relationnelles/screens/ressource.dart';

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
        title: const Text("Ressources Relationnelles"),
        backgroundColor: const Color.fromARGB(255, 92, 233, 255),
        //automaticallyImplyLeading: false,
      ),
      body: listeLiens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
