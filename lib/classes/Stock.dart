import 'dart:convert';

class Stock {
  final String symbol;
  final String companyName;
  final String primaryExchange;
  final double iexRealtimePrice;
  final double change;
  final double changePercent;

  Stock({
    this.symbol,
    this.companyName,
    this.primaryExchange,
    this.iexRealtimePrice,
    this.change,
    this.changePercent,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'] as String,
      companyName: json['companyName'] as String,
      primaryExchange: json['primaryExchange'] as String,
      iexRealtimePrice: json['iexRealtimePrice'] as double,
      change: json['change'] as double,
      changePercent: json['changePercent'] as double,
    );
  }
}
