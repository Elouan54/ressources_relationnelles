import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../providers/ressources.dart';

final dio = Dio();

class Ressource extends StatefulWidget {
  const Ressource({super.key});

  @override
  State<Ressource> createState() => _RessourceState();
}

class _RessourceState extends State<Ressource> {
  List<Ressources> ressources = [];
  final dio = Dio();

  @override
  void initState() {
    fetchRessources();
    super.initState();
  }

  void fetchRessources() async {
    List<Ressources> lesRessources = [];
    final response =
        await dio.get('http://localhost:5083/api/Ressources'); //erreur 500
    print(response.statusCode);
    response.data.forEach((data) {
      final Ressources ressource = Ressources(
          id_ressource: data["id_ressource"] ?? 0,
          titre: data["titre"].toString(),
          langue_nom: data["langue_nom"].toString(),
          date_moderation: data["date_moderation"].toString(),
          validation_moderation:
              (data["validation_moderation"] == 0 ? false : true),
          description: data["description"].toString(),
          age_minimum: data["age_minimum"] ?? 0,
          compteur_vue: data["compteur_vue"] ?? 0);

      lesRessources.add(ressource);
    });

    setState(() {
      ressources = lesRessources;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ressources.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ressources[index].titre,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    ressources[index].description,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
