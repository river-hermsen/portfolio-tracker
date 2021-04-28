import 'package:flutter/material.dart';
import 'api/apiFunctions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    getPopularStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: ListView(
        children: <Widget>[
          Container(
            child: RichText(
              text: TextSpan(
                text: 'Welcome back, ',
                style: new TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '\nRiver Hermsen',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.album),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text(
                            'Music by Julie Gable. Lyrics by Sidney Stein.'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('BUY TICKETS'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('LISTEN'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
