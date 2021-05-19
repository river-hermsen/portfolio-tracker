import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff33404F),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "X VOLT",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Icon(
                        FluentIcons.person_circle_20_regular,
                        size: 38,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      "Hi Rivertje!",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    'Have a look at your balance.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          FluentIcons.caret_up_24_filled,
                          size: 42,
                          color: Color(0xff00DDA3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '€ 50.268.23',
                                style: TextStyle(
                                  fontSize: 34,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '€ +28,29 (+21,3%)',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff00DDA3),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.1,
                builder: (_, controller) {
                  return Material(
                      elevation: 10,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Stocks.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff33404F),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                controller: controller,
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('Stock :$index'),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
