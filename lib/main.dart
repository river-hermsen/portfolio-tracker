import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'home.dart' as Home;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff19CEC3),
        accentColor: Color(0xff172121),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home.Home(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? new Icon(
                        FluentIcons.home_28_filled,
                      )
                    : new Icon(
                        FluentIcons.home_28_regular,
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? new Icon(
                        FluentIcons.star_28_filled,
                      )
                    : new Icon(
                        FluentIcons.star_28_regular,
                      ),
                label: 'Watchlist',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? new Icon(
                        FluentIcons.search_28_filled,
                      )
                    : new Icon(
                        FluentIcons.search_28_regular,
                      ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? new Icon(
                        FluentIcons.data_pie_24_filled,
                      )
                    : new Icon(
                        FluentIcons.data_pie_24_regular,
                      ),
                label: 'Portfolio',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 4
                    ? new Icon(
                        FluentIcons.alert_32_filled,
                      )
                    : new Icon(
                        FluentIcons.alert_32_regular,
                      ),
                label: 'Notifications',
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
