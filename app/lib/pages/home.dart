import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  static const Color mainColor=Colors.blueGrey;

  @override
  State<homePage> createState() => _homePageState();
}
class _homePageState extends State<homePage>{
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
