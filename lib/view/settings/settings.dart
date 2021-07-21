import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              MaterialButton(onPressed: () {}, child: Text('orange'), minWidth: double.infinity),
              MaterialButton(onPressed: () {}, child: Text('red'), minWidth: double.infinity),
              MaterialButton(onPressed: () {}, child: Text('blue'), minWidth: double.infinity),
              MaterialButton(onPressed: () {}, child: Text('teal'), minWidth: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}
