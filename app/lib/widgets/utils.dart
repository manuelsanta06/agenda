import 'package:flutter/material.dart';
/// mini buttons with floatting text next to it
Widget buildMiniFab(
  {required IconData icon,
    required String label,
    required VoidCallback onPressed}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2))
          ],
        ),
        child: Text(label,
          style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      const SizedBox(width: 8),
      // El boton
      FloatingActionButton.small(
        onPressed: ()=>onPressed(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[700],
        heroTag: null,
        child: Icon(icon),
      ),
    ],
  );
}

