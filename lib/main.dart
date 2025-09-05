import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/colectivos.dart';
import 'pages/people.dart';
import 'pages/calendar.dart';
import 'pages/trips.dart';

void main(){
  runApp(const MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
    int _selectedIndex = 0;
    
    final List<Widget> _pages = const [
        peoplePage(),
        calendarPage(),
        homePage(),
        tripsPage(),
        colectivosPage(),
    ];

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }


    // This widget is the root of your application.
    @override
    Widget build(BuildContext context,){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'FiraCode Nerd Font'),
            home:Scaffold(
                body: _pages[_selectedIndex],

                bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.shifting,
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    items: const [
                        BottomNavigationBarItem(
                            backgroundColor: Colors.red,
                            icon: Icon(Icons.airline_seat_recline_extra),
                            label: 'Choferes',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.red,
                            icon: Icon(Icons.calendar_month),
                            label: 'Calendario',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.black,
                            icon: Icon(Icons.home),
                            label: 'Inicio',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.red,
                            icon: Icon(Icons.pets),
                            label: 'algo mas',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.red,
                            icon: Icon(Icons.directions_bus),
                            label: 'Colectivos',
                        ),
                    ],
                ),
            )
        );
    }
}
