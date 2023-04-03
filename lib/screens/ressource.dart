import 'package:flutter/material.dart';

class Ressource extends StatefulWidget {
  const Ressource({super.key});

  @override
  State<Ressource> createState() => _RessourceState();
}

class _RessourceState extends State<Ressource> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("ressources"),
    );
  }
}
