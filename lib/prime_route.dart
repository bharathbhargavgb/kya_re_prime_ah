import 'package:flutter/material.dart';

class PrimeNumber extends StatefulWidget {
  createState() => PrimeNumberState();
}

class PrimeNumberState extends State<PrimeNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kya re prime ah?'),
      ),
      body: Center(
        child: Text('Il y a des cheveux'),
      ),
    );
  }
}