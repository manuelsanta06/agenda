import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'database/app_database.dart';

import 'pages/home.dart';
import 'pages/colectivos.dart';
import 'pages/people.dart';
import 'pages/calendar.dart';
import 'pages/trips.dart';

bool darkMode=true;

void main(){
  final database = AppDatabase();
  initializeDateFormatting().then((_) => runApp(
    Provider<AppDatabase>.value(
      value: database,
      child: const MyApp(),
      //dispose: (context, db) => db.close(), 
    ),
  ));
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

  @override
  Widget build(BuildContext context,){
    return MaterialApp(
      title: "Pincen",
      debugShowCheckedModeBanner: false,

      locale: const Locale('es', 'ES'), 
      
      //supported lenguajes
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      //LIGHT THEME COLORS
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        cardColor: Colors.white,
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'FiraCode Nerd Font',
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
      //DARK THEME COLORS
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: Colors.white12,
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'FiraCode Nerd Font',
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.black,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
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
              backgroundColor: peoplePage.mainColor,
              icon: Icon(Icons.airline_seat_recline_extra),
              label: 'Choferes',
            ),
            BottomNavigationBarItem(
              backgroundColor: calendarPage.mainColor,
              icon: Icon(Icons.calendar_month),
              label: 'Calendario',
            ),
            BottomNavigationBarItem(
              backgroundColor: homePage.mainColor,
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              backgroundColor: tripsPage.mainColor,
              icon: Icon(Icons.question_mark),
              label: '???',
            ),
            BottomNavigationBarItem(
              backgroundColor: colectivosPage.mainColor,
              icon: Icon(Icons.directions_bus),
              label: 'Colectivos',
            ),
          ],
        ),
      )
    );
  }
}
