import 'package:flutter/material.dart';
import 'package:flutter_application_1/Register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(
      child: Text('Profile'),
    ),
    const Center(
      child: Text('Chat'),
    ),
    const Center(
      child: Text('Calls'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('KidsApp'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to KidsApp'),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: BottomNavigation(),
  );
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // der derzeit ausgewählte Index
  int _selectedIndex = 0;
  // Eine Liste mit Widgets, welche von der BottomNavigation angezeigt werden können.
  static const List<Widget> _widgetOptions = <Widget>[
    // Hier ist wieder unser eben deklariertes Widget
    Text('Profile'),
    // Ein weiteres Widget, welches nicht extern erstellt wurde
    Text('Chat'),
    // Noch ein Widget
    Text('Calls'),
  ];
  // Die funktion welche bei onTap aufgerufen wird (sehr ähnlich zu dem Counter
  // Standart Flutter App welchen wir neulich besprochen haben.)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Zeige den Body in der Mitte Zentriert an
      //body: Center(
      // _widgetoptions ist die eben erstelle Liste mit Widgets
      // Aus dies Liste übergeben wir eine Stelle.
      //Das widget an der Stelle die wir übergeben haben wird angezeigt.
      //  child: _widgetOptions.elementAt(_selectedIndex),
      //),
      // Das Hauptwidget der BottomNavigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        // Die Verschiedenen Schaltflächen in der Bar
        // Hier könnte man auch noch weitere hinzufügen.
        items: const <BottomNavigationBarItem>[
          // Jede Schaltfläche in der Bar ist ein "BottomNavigationBarItem"
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.join_full_sharp),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Calls',
          ),
        ],
        //Der derzeitige Index für die Ausgewählte Schaltfläche (welche von uns mit
        // der _onItemTapped gesteuert wird)
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        // bei der onTap Methode rufen wir unsere Methode auf um den Index zu steuern.
        onTap: _onItemTapped,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 400,
              height: 400,
              child: Placeholder(),
            ),
            Text(
              'Edit your Profile!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 400,
              height: 400,
              child: Placeholder(),
            ),
            Text(
              'Start chatting!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calls'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 400,
              height: 400,
              child: Placeholder(),
            ),
            Text(
              'Start making calls!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
