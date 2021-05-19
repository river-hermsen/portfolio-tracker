import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      FluentIcons.search_16_regular,
                      size: 24,
                    ),
                    hintText: 'Search stocks or ETFs'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
