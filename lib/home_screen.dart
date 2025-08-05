// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  Timer? _timer; 

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _startIncrementing() {
    _timer = Timer.periodic(Duration(milliseconds: 80), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  void _stopIncrementing() {
    _timer?.cancel();
  }

  void _decreasecounter() {
    setState(() {
      _counter--;
    });
  }

  void _startDecrementing() {
    _timer = Timer.periodic(Duration(milliseconds: 80), (timer) {
      setState(() {
        if (_counter > 0) _counter--;
      });
    });
  }

  void _stopDecrementing() {
    _timer?.cancel();
  }

  void rest() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191C20),
      appBar: AppBar(
        title: Text("Counter App"),
        backgroundColor: Color(0xFF272A2F),
        actions: [
          IconButton(
            onPressed: rest,
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 30.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xff194975),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  "$_counter",
                  style: TextStyle(fontSize: 100, color: Color(0xffD1E4FF)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 60,
                  child: GestureDetector(
                    onLongPress: _startIncrementing,
                    onLongPressUp: _stopIncrementing,
                    child: FilledButton(
                      onPressed: _incrementCounter,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xffa0cafd),
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Color(0xff003258),
                        ),
                      ),
                      child: Text("+",
                          style: TextStyle(
                            fontSize: 32,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 60,
                  child: GestureDetector(
                    onLongPress: _startDecrementing,
                    onLongPressUp: _stopDecrementing,
                    child: FilledButton(
                      onPressed: _counter > 0 ? _decreasecounter : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xffa0cafd),
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Color(0xff003258),
                        ),
                      ),
                      child: Text("-",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
