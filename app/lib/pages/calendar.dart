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
  DateTime? end;

  Stop({required this.name,});
}

class Event{
  bool repeat=false;
  String? name;
  DateTime? start;
  List<Stop> stops=[];
  List<WeekDays> days=[];
  List<Chofer> people=[];
  List<Colectivo> buses=[];

  Event(){}
}

class Trip extends Event{
  DateTime? end;
}

final List<Event> events = [];


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
      vsync:this,
      duration:const Duration(milliseconds:200),
    );
    // (scrim)
    _scrimFadeAnimation = Tween<double>(begin:0.0, end:1.0).animate(
      CurvedAnimation(parent:_animationController, curve:Curves.easeIn),
    );
    // small-buttons appearing animation
    _buttonsFadeAnimation = Tween<double>(begin:0.0, end:1.0).animate(
      CurvedAnimation(parent:_animationController, curve:Curves.easeIn),
    );
    // color animation for the main FAB
    _fabColorAnimation = ColorTween(
      begin:calendarPage.mainColor,
      end:Colors.white,
    ).animate(_animationController);
    // color animation for the main FAB's icon
    _fabIconColorAnimation = ColorTween(
      begin:Colors.white,
      end:calendarPage.mainColor,
    ).animate(_animationController);
    // icon rotation
    _fabRotationAnimation = Tween<double>(begin:0.0, end:0.125).animate(
      CurvedAnimation(parent:_animationController, curve:Curves.linear),
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

  void _showCreateTripSheet(bool trip) async {
    final newTrip = await showModalBottomSheet<Event>(
      context:context,
      isScrollControlled:true,
      builder:(context) {
        return CreateTripSheet(isTrip:trip);
      },
    );

    if (newTrip != null) {
      setState((){events.add(newTrip);});
      // Confirmation snackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text('Viaje "${newTrip.name}" creado.'),
          backgroundColor:Colors.green,
        ),
      );
    }
  }
  
  /// builds the small buttons
  Widget _buildButtonColumn() {
    return FadeTransition(
      opacity:_buttonsFadeAnimation,
      child:SlideTransition(
        position:Tween<Offset>(
          begin:const Offset(0, 0.5),
          end:Offset.zero,
        ).animate(
        CurvedAnimation(parent:_animationController, curve:Curves.easeOut)),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.end,
          crossAxisAlignment:CrossAxisAlignment.end,
          children:[
            buildMiniFab(
              icon:Icons.directions_bus,
              label:"Viaje",
              onPressed:() {
                _toggleMenu();
                _showCreateTripSheet(true);
              },
            ),
            const SizedBox(height:8),
            buildMiniFab(
              icon:Icons.task_alt,
              label:"Recordatorio",
              onPressed:() {
                _toggleMenu();
                _showCreateTripSheet(false);
              },
            ),
            const SizedBox(height:16), 
          ],
        ),
      ),
    );
  }

  Widget _buildMainFab() {
    return AnimatedBuilder(
      animation:_animationController,
      builder:(context, child) {
        return FloatingActionButton(
          onPressed:_toggleMenu,
          backgroundColor:_fabColorAnimation.value,
          child:RotationTransition(
            turns:_fabRotationAnimation,
            child:Icon(Icons.add,color:_fabIconColorAnimation.value),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit:StackFit.expand,
        children:[
          // main page
          SafeArea(child:Column(children:[
            mySearchBar(onChanged:(value){setState((){searchQuery = value;});},),
          ],),),

          // black background (scrim)
          if (_isMenuOpen)FadeTransition(
            opacity:_scrimFadeAnimation,
            child:GestureDetector(
              onTap:_toggleMenu,
              child:Container(
                color:Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          // Floatting buttons
          Positioned(
            bottom:16.0,
            right:16.0,
            child:Column(
              mainAxisAlignment:MainAxisAlignment.end,
              crossAxisAlignment:CrossAxisAlignment.end,
              children:[
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




class CreateTripSheet extends StatefulWidget {
  final bool isTrip;
  const CreateTripSheet({super.key,required this.isTrip});

  @override
  State<CreateTripSheet> createState() => _CreateTripSheetState();
}

class _CreateTripSheetState extends State<CreateTripSheet> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _stopControllers = [
    TextEditingController(), // Parada inicial
  ];

  void _addStopField() {
    setState(() {
      _stopControllers.add(TextEditingController());
    });
  }

  void _removeStopField(int index) {
    setState(() {
      _stopControllers.removeAt(index);
    });
  }

  // TODO: hacer que el trip sea global
  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      final newTrip = Trip()
          ..name = _nameController.text
          ..start = DateTime.now() // (Deberías añadir un DatePicker)
          ..stops = _stopControllers
          .map((controller) => Stop(name:controller.text))
          .where((stop) => stop.name.isNotEmpty) // Filtra paradas vacías
          .toList();

      // Devolvemos el nuevo viaje a la pantalla anterior
      Navigator.pop(context, newTrip);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (var controller in _stopControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usamos la altura del 80% del dispositivo
    return FractionallySizedBox(
      heightFactor:0.8,
      child:Container(
        padding:const EdgeInsets.all(16.0),
        // Bordes redondeados
        decoration:const BoxDecoration(
          borderRadius:BorderRadius.vertical(top:Radius.circular(20)),
        ),
        child:Form(
          key:_formKey,
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              // UPPER BAR
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                  Expanded(child:TextFormField(
                    controller:_nameController,
                    decoration:const InputDecoration(
                      labelText:"Nombre",
                      fillColor:Colors.transparent,
                      //border:UnderlineInputBorder(),
                      //prefixIcon:Icon(Icons.label_outline),
                    ),
                    validator:(value) {
                      if (value == null || value.isEmpty)return 'Por favor, ingresa un nombre';
                      return null;
                    },
                  )),
                  ElevatedButton(
                    onPressed:_onSave,
                    style:ElevatedButton.styleFrom(
                      backgroundColor:calendarPage.mainColor,
                      foregroundColor:Colors.white,
                    ),
                    child:const Text("Guardar"),
                  ),
                ],
              ),
              const Divider(height:5),

              // TODO: chofer-colectivo
              Row(),

              // TODO: fecha y hora (pensar como)

              // STOPS
              Text(
                widget.isTrip?"Paradas":"lugar",
                style:TextStyle(fontSize:16, fontWeight:FontWeight.bold),
              ),
              Expanded(child:ListView.builder(
                itemCount:_stopControllers.length,
                itemBuilder:(context, index) {
                  return Padding(
                    padding:const EdgeInsets.symmetric(vertical:4.0),
                    child:Row(
                      children:[
                        Expanded(child:TextFormField(
                          controller:_stopControllers[index],
                          decoration:InputDecoration(
                            labelText:widget.isTrip?'Parada ${index + 1}':"Parada",
                            border:const OutlineInputBorder(),
                            prefixIcon:const Icon(Icons.location_on_outlined),
                          ),
                        )),
                        // DELETE BUTTON
                        if (_stopControllers.length > 1)
                        IconButton(
                          icon:const Icon(Icons.remove_circle_outline, color:Colors.red),
                          onPressed:() => _removeStopField(index),
                        ),
                      ],
                    ),
                  );
                },
              )),
              if(widget.isTrip)
              TextButton.icon(
                onPressed:_addStopField,
                icon:const Icon(Icons.add, color:calendarPage.mainColor),
                label:const Text("Añadir parada", style:TextStyle(color:calendarPage.mainColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
