import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:fl_chart/fl_chart.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  List<String> chartIntervalItems = ["1D", "1W", "1M", "1Y", "MAX"];
  int activeChartIntervalItem = 0;
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
                        "X",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Icon(
                        FluentIcons.person_circle_20_regular,
                        size: 38,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 25.0),
                  //   child: Text(
                  //     "Hi River!",
                  //     style: TextStyle(
                  //         fontSize: 34,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white),
                  //   ),
                  // ),
                  // Text(
                  //   'Have a look at your balance.',
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w100,
                  //       color: Colors.white),
                  // ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      "Overview",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 250,
                    margin: const EdgeInsets.only(top: 20.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Color(0xff232d37),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 18.0, left: 12.0, top: 24, bottom: 12),
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              getTextStyles: (value) => const TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 2:
                                    return 'MAR';
                                  case 5:
                                    return 'JUN';
                                  case 8:
                                    return 'SEP';
                                }
                                return '';
                              },
                              margin: 8,
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                color: Color(0xff67727d),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 1:
                                    return '10k';
                                  case 3:
                                    return '30k';
                                  case 5:
                                    return '50k';
                                }
                                return '';
                              },
                              reservedSize: 28,
                              margin: 12,
                            ),
                          ),
                          borderData: FlBorderData(
                              show: true,
                              border: Border.all(
                                  color: const Color(0xff37434d), width: 1)),
                          minX: 0,
                          maxX: 11,
                          minY: 0,
                          maxY: 6,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(2.6, 2),
                                FlSpot(4.9, 5),
                                FlSpot(6.8, 3.1),
                                FlSpot(8, 4),
                                FlSpot(9.5, 3),
                                FlSpot(11, 4),
                              ],
                              isCurved: true,
                              colors: gradientColors,
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: gradientColors
                                    .map((color) => color.withOpacity(0.3))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i in chartIntervalItems)
                        GestureDetector(
                          onTap: () {
                            print(i);
                            activeChartIntervalItem =
                                chartIntervalItems.indexOf(i);
                            print(activeChartIntervalItem);
                          },
                          child: Container(
                            key: Key(i),
                            margin: const EdgeInsets.only(top: 10),
                            width: 55,
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              color: Color(0xff232d37),
                            ),
                            child: Center(
                              child: Text(
                                i,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: chartIntervalItems.indexOf(i) ==
                                          activeChartIntervalItem
                                      ? Colors.white
                                      : Color(0xff67727d),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
            Positioned.fill(
              child: DraggableScrollableSheet(
                initialChildSize: 0.8,
                maxChildSize: 0.9,
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
                                itemCount: 2,
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
