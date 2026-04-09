import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'database/app_database.dart';
import 'utilities/syncService.dart';
import 'utilities/settings.dart';

import 'pages/home.dart';
import 'pages/colectivos.dart';
import 'pages/choferes.dart';
import 'pages/calendar.dart';
import 'pages/recorridos.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  final database=AppDatabase();
  final settings=SettingsProvider();
  settings.init();
  SyncService.performFullSync(database);
  Intl.defaultLocale='es_AR';
  initializeDateFormatting().then((_) => runApp(
    MultiProvider(
      providers:[
        Provider<AppDatabase>.value(value: database),
        ChangeNotifierProvider<SettingsProvider>.value(value: settings),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  int _selectedIndex=2;

  final List<Widget> _pages = const [
    peoplePage(),
    calendarPage(),
    homePage(),
    recorridosPage(),
    colectivosPage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state==AppLifecycleState.resumed){
      final db=Provider.of<AppDatabase>(context,listen: false);
      SyncService.performFullSync(db).catchError((e)=>print("Error Sync: $e"));
    }else if(state==AppLifecycleState.paused||state==AppLifecycleState.inactive){
      final db=Provider.of<AppDatabase>(context,listen:false);
      SyncService.pushUnsyncedData(db).catchError((e)=>print("Error Push: $e"));
    }
  }


  @override
  Widget build(BuildContext context,){
    return MaterialApp(
      title: "Pincen",
      debugShowCheckedModeBanner: false,

      locale: const Locale('es', 'ES'), 
      
      //supported lenguajes
      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'US'),
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
      themeMode:context.watch<SettingsProvider>().getValue("dark_mode")?ThemeMode.dark:ThemeMode.light,

      home:Scaffold(
        body: _pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: peoplePage.mainColor,
              icon: Icon(Icons.airline_seat_recline_extra,color:Colors.black),
              label: 'Choferes',
            ),
            BottomNavigationBarItem(
              backgroundColor: calendarPage.mainColor,
              icon: Icon(Icons.calendar_month,color:Colors.black),
              label: 'Calendario',
            ),
            BottomNavigationBarItem(
              backgroundColor: homePage.mainColor,
              icon: Icon(Icons.home,color:Colors.black),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              backgroundColor: recorridosPage.mainColor,
              icon: Icon(Icons.school,color:Colors.black),
              label: 'Recorridos',
            ),
            BottomNavigationBarItem(
              backgroundColor: colectivosPage.mainColor,
              icon: Icon(Icons.directions_bus,color:Colors.black),
              label: 'Colectivos',
            ),
          ],
        ),
      )
    );
  }
}
