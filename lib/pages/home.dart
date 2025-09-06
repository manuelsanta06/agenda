import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(child: Column(
            children: [
                Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Buscar",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                            )
                        ),
                    ),
                ),
            ],
        ),),
    );
  }
}
