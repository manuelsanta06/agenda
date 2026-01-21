import 'package:flutter/material.dart';

import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:provider/provider.dart';
import 'package:agenda/database/app_database.dart';

class tripsPage extends StatefulWidget {
  const tripsPage({super.key});
  static const Color mainColor=Colors.green;

  @override
  State<tripsPage> createState() => _tripsPageState();
}
class _tripsPageState extends State<tripsPage>{
  Widget build(BuildContext context) {
    return Column(
      children:[
        const SizedBox(height: 15),
        ElevatedButton.icon(
          icon: const Icon(Icons.storage),
          label: const Text("Ver Base de Datos"),
          onPressed: () {
            final db = Provider.of<AppDatabase>(context, listen: false);

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DriftDbViewer(db)),
            );
          },
        )
      ]
    );
  }
}
