import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:invest/classes/Stock.dart';
import 'api/apiFunctions.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key key,
    this.symbol,
    this.companyName,
    this.iexRealtimePrice,
    this.latestPrice,
    this.change,
    this.changePercent,
  }) : super(key: key);

  final String symbol;
  final String companyName;
  final double iexRealtimePrice;
  final double latestPrice;
  final double change;
  final double changePercent;

  @override
  Widget build(BuildContext context) {
    double finalPrice;
    bool isUp = (changePercent > 0);
    Color percentColor = isUp ? Color(0xff44FCBA) : Color(0xffFC4444);
    // double price = iexRealtimePrice != null ? latestPrice : iexRealtimePrice;
    if (iexRealtimePrice != null) {
      double finalPrice = latestPrice;
    } else {
      double finalPrice = latestPrice;
    }

    print(finalPrice);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: NetworkImage(
                        "https://storage.googleapis.com/iex/api/logos/" +
                            symbol +
                            ".png"),
                    height: 42,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  companyName,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Trueno Round"),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Trueno Round"),
                        children: [
                          TextSpan(
                            text: latestPrice.toString(),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FluentIcons.arrow_up_48_filled,
                          size: 18,
                          color: percentColor,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: percentColor,
                                fontFamily: "Trueno Round"),
                            children: [
                              TextSpan(
                                text: change.toString(),
                              ),
                              TextSpan(
                                text: " (" +
                                    changePercent.toStringAsFixed(2) +
                                    "%)",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Color(0xffD3D3D3),
            indent: 50,
            endIndent: 50,
            thickness: 1.0,
          )
        ],
      ),
    );
  }
}

class _HomeState extends State<Home> {
  Future<List<Stock>> _popularStocks;
  // final children = <Widget>[];
  int _currentIndex = 0;
  List cardList = [Item1(), Item2()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  initState() {
    super.initState();
    _popularStocks = getPopularStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20),
      child: ListView(
        children: <Widget>[
          Container(
            child: RichText(
              text: TextSpan(
                text: 'Welcome back, ',
                style: new TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: "Trueno Round"),
                children: <TextSpan>[
                  TextSpan(
                      text: '\nRiver Hermsen',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Trueno Round")),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 0, right: 0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                  bottom: 25,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "My Portfolio",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "PNL",
                            style: TextStyle(color: Colors.black54),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "\$699,78",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "+\$20 / +3\%",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff44FCBA),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            new Spacer(),
                            Row(
                              children: [
                                Icon(
                                  FluentIcons.arrow_circle_down_24_filled,
                                  size: 18,
                                  color: Colors.black87,
                                ),
                                Text(
                                  " Details",
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            decoration: new BoxDecoration(
              boxShadow: [
                new BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 10.0),
                    blurRadius: 60.0,
                    spreadRadius: -55),
              ],
            ),
          ),
          Container(
            child: Text(
              "Most Popular Stocks Today",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: FutureBuilder(
              future: _popularStocks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    // print(snapshot.data);
                    //
                    // return (for (var i in snapshot.data)
                    //       Text(i.symbol.toString()));
                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        for (var i = 0; i < 5; i++)
                          CustomListItem(
                            symbol: snapshot.data[i].symbol,
                            companyName: snapshot.data[i].companyName,
                            iexRealtimePrice: snapshot.data[i].iexRealtimePrice,
                            latestPrice: snapshot.data[i].latestPrice,
                            change: snapshot.data[i].change,
                            changePercent: snapshot.data[i].changePercent,
                          ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                } else {
                  return Text("Loading");
                }
              },
            ),
          ),
          Container(
              child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 30),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: false,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: card,
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
            bottom: 25,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image(
                      image: NetworkImage(
                          "https://storage.googleapis.com/iex/api/logos/AAPL.png"),
                      height: 42,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Apple Inc",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text("")),
                  Expanded(
                    flex: 4,
                    child: Text(
                      "AAPL ?? STOCK ?? US",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(flex: 1, child: Text("")),
              //     Expanded(
              //       flex: 4,
              //       child: Text(
              //         "AAPL",
              //         style: TextStyle(color: Colors.black54),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
              color: Colors.black,
              offset: Offset(0, 10.0),
              blurRadius: 60.0,
              spreadRadius: -55),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff5f2c82), Color(0xff49a09d)]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
