import 'package:flutter/material.dart';
import 'package:invest/classes/Stock.dart';
import 'api/apiFunctions.dart';

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
    this.change,
    this.changePercent,
  }) : super(key: key);

  final String symbol;
  final String companyName;
  final double iexRealtimePrice;
  final double change;
  final double changePercent;

  @override
  Widget build(BuildContext context) {
    bool isUp = (changePercent > 0);
    Color percentColor = isUp ? Color(0xff44FCBA) : Color(0xffFC4444);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
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
                flex: 2,
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
                            text: iexRealtimePrice.toString(),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: percentColor, fontFamily: "Trueno Round"),
                        children: [
                          TextSpan(
                            text: change.toString(),
                          ),
                          TextSpan(
                            text:
                                " (" + changePercent.toStringAsFixed(2) + "%)",
                          ),
                        ],
                      ),
                    )
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

  initState() {
    super.initState();
    _popularStocks = getPopularStocks();
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
                        for (var i in snapshot.data)
                          CustomListItem(
                            symbol: i.symbol,
                            companyName: i.companyName,
                            iexRealtimePrice: i.iexRealtimePrice,
                            change: i.change,
                            changePercent: i.changePercent,
                          ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
