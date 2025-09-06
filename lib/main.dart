import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/colectivos.dart';
import 'pages/people.dart';
import 'pages/calendar.dart';
import 'pages/trips.dart';

bool darkMode=true;

void main(){
    runApp(const MyApp(),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
    int _selectedIndex = 2;
    
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
            theme: ThemeData.light().copyWith(
                textTheme: ThemeData.light().textTheme.apply(
                    fontFamily: 'FiraCode Nerd Font',
                ),
                inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                ),
            ),
            darkTheme: ThemeData.dark().copyWith(
                textTheme: ThemeData.dark().textTheme.apply(
                    fontFamily: 'FiraCode Nerd Font',
                ),
                inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.black,
                ),
            ),
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,

            home:Scaffold(
                body: _pages[_selectedIndex],

                bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.shifting,
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    items: const [
                        BottomNavigationBarItem(
                            backgroundColor: Colors.purple,
                            icon: Icon(Icons.airline_seat_recline_extra),
                            label: 'Choferes',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.cyan,
                            icon: Icon(Icons.calendar_month),
                            label: 'Calendario',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.blueGrey,
                            icon: Icon(Icons.home),
                            label: 'Inicio',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Colors.green,
                            icon: Icon(Icons.add_road),
                            label: 'recorridos',
                        ),
                        BottomNavigationBarItem(
                            backgroundColor: Color.fromARGB(255, 252, 102, 1),
                            icon: Icon(Icons.directions_bus),
                            label: 'Colectivos',
                        ),
                    ],
                ),
            )
        );
    }
}
