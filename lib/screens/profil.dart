import 'package:flutter/material.dart';
import 'package:ressources_relationnelles/screens/connexion.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  var user_id;

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      user_id = prefs.getInt('user');
    });
    print("user = " + user_id.toString());
  }

  removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    getUser();
  }

  @override
  void initState() {
    getUser();
    Future.delayed(const Duration(seconds: 1), () {
      if (user_id == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Connexion()),
        ).then((_) => _stateUpdate());
      }
    });

    super.initState();
  }

  void _stateUpdate() {
    getUser();
    print("refresh done");
  }

  verifConnexion() {
    //print(user_id);
    if (user_id != null) {
      removeUser();
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Connexion(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Bienvenue sur votre page de profil',
            style: TextStyle(fontSize: 24.0),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: verifConnexion,
            child: Text(
              user_id != null ? 'Déconnexion' : 'Connexion',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
