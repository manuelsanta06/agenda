import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(child: Column(
            children: [
                mySearchBar(),
            ],
        ),),
    );
  }
}
