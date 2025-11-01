import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';
import '../widgets/utils.dart';
import 'colectivos.dart';
import 'people.dart';

enum WeekDays{
  NONE,
  LUNES,
  MARTES,
  MIERCOLES,
  JUEVES,
  VIERNES,
  SABADO,
  DOMINGO
}

class Stop{
  String name;
  DateTime? start;
  DateTime? end;

  Stop({required this.name,});
}

class Event{
  String? name;
  List<Colectivo> buses=[];
  List<Chofer> people=[];
  List<Stop> stops=[];

  Event({this.name}){
  }
}

class calendarPage extends StatefulWidget {
  const calendarPage({super.key});
  static const Color mainColor=Colors.cyan;

  @override
  State<calendarPage> createState() => _calendarPageState();
}
class _calendarPageState extends State<calendarPage> with TickerProviderStateMixin{
  String searchQuery = "";
  bool _isMenuOpen = false;

  // main animation manager 
  late AnimationController _animationController;

  // specific animations
  late Animation<double> _scrimFadeAnimation;
  late Animation<double> _buttonsFadeAnimation;
  late Animation<Color?> _fabColorAnimation;
  late Animation<Color?> _fabIconColorAnimation;
  late Animation<double> _fabRotationAnimation;

  @override
  void initState() {
    super.initState();
    // general animation (ej. 200ms)
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    // (scrim)
    _scrimFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    // small-buttons appearing animation
    _buttonsFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    // color animation for the main FAB
    _fabColorAnimation = ColorTween(
      begin: calendarPage.mainColor,
      end: Colors.white,
    ).animate(_animationController);
    // color animation for the main FAB's icon
    _fabIconColorAnimation = ColorTween(
      begin: Colors.white,
      end: calendarPage.mainColor,
    ).animate(_animationController);
    // icon rotation
    _fabRotationAnimation = Tween<double>(begin: 0.0, end: 0.125).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Funcion para abrir/cerrar el menu
  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  
  /// nuilds the small buttons
  Widget _buildButtonColumn() {
    return FadeTransition(
      opacity: _buttonsFadeAnimation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildMiniFab(
              icon: Icons.directions_bus,
              label: "Viaje",
              onPressed: () {
                _toggleMenu();
                print("Crear Viaje");
              },
            ),
            const SizedBox(height: 8),
            buildMiniFab(
              icon: Icons.calendar_today,
              label: "Recorrido",
              onPressed: () {
                _toggleMenu();
                print("Crear Evento");
              },
            ),
            const SizedBox(height: 8),
            buildMiniFab(
              icon: Icons.task_alt,
              label: "Recordatorio",
              onPressed: () {
                _toggleMenu();
                print("Crear Recordatorio");
              },
            ),
            const SizedBox(height: 16), 
          ],
        ),
      ),
    );
  }

  Widget _buildMainFab() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FloatingActionButton(
          onPressed: _toggleMenu,
          backgroundColor: _fabColorAnimation.value,
          child: RotationTransition(
            turns: _fabRotationAnimation,
            child: Icon(Icons.add,color: _fabIconColorAnimation.value),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // main page
          SafeArea(child:Column(children:[
            mySearchBar(onChanged: (value){setState((){searchQuery = value;});},),
          ],),),

          // black background (scrim)
          if (_isMenuOpen)
          FadeTransition(
            opacity: _scrimFadeAnimation,
            child: GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          // Floatting buttons
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              if (_isMenuOpen) _buildButtonColumn(),
              _buildMainFab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
