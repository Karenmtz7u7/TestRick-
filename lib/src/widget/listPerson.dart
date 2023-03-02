import 'package:flutter/material.dart';
import 'package:test_rym_app/src/service/ApiService.dart';

class ListCharacteres extends StatelessWidget {
  const ListCharacteres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Lista de Personajes", 
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,),
      ),


      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService.getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final characters = snapshot.data!["results"];
            return ListView.builder(
              
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];

                return ListTile(
                  leading: Image.network(character["image"]),
                  trailing: Icon(
                    character['gender'] == 'Male'
                        ? Icons.male
                        : Icons.female,),

                  title: Text("Nombre: ${character["name"]}"),
                  subtitle: Text("Estado actual: ${character["status"]}",
                    style: TextStyle(
                      color: character['status'] == 'Alive'
                          ? Colors.green
                          : character['status'] == 'Dead'
                              ? Colors.orange.shade900
                              : Colors.orange.shade900,
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.green.shade200],
                            ),
                          ),
                          child: Expanded(
                            child: Column( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(height: 30),
                               CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage: NetworkImage(character['image']),
                                ),
                             
                              const SizedBox(height: 10),
                              Text(character['name'],
                                style: const TextStyle(
                                  fontSize: 20
                                ),
                              ),
                            
                                const SizedBox(height: 10),
                                Text('Estado Actual: ${character['status']}',  
                                style: TextStyle(
                                  color: character['status'] == 'Alive'
                                    ? Colors.green
                                    : character['status'] == 'Dead'
                                    ? Colors.orange.shade900
                                    : Colors.orange.shade900,
                                    fontSize: 10
                                 ),
                                 ),
                            const SizedBox(height: 10),
                              Text('Especie: ${character['species']}', style: const TextStyle(
                                  fontSize: 10
                                ),),
                           
                              const SizedBox(height: 10),
                              Text('Genero: ${character['gender']}', style: const TextStyle(
                                  fontSize: 10
                                ),),                              
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                    Navigator.pop(context);
                                  },
                                child: const Text('< Regresar'),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                         ),
                        );
                      },
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}