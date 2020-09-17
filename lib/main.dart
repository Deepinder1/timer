import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int of hr, min and sec
  int hour = 0;
  int min = 0;
  int sec = 0;

  //for displaying time
  String timeToDisplay = '';

  //creating boolean for start and stop button
  bool started = true;
  bool stoped = true;

  //creating an int for calculating time
  int timefortimer;

  //start and stop simple logic
  void start() {
    //getting time in seconds
    timefortimer = ((hour * 3600) + (min * 60) + sec);
    //timer
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      //it is callback func
      //it is created to stop timer
      // Duration is 1 timer will be created after each second
      setState(() {
        if (timefortimer < 1) {
          t.cancel();
        } else {
          timefortimer = timefortimer - 1;
          timeToDisplay = timefortimer.toString();
        }
      });
    });
  }

  void stop() {}

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'HH',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: hour,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'MM',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: min,
                      minValue: 0,
                      maxValue: 59,
                      listViewWidth: 60.0,
                      onChanged: (value) {
                        setState(() {
                          min = value;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'SS',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: sec,
                      minValue: 0,
                      maxValue: 59,
                      listViewWidth: 60.0,
                      onChanged: (value) {
                        setState(() {
                          sec = value;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(timeToDisplay),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 12.0,
                  ),
                  onPressed: started ? start : null,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 12.0,
                  ),
                  onPressed: stoped ? null : stop,
                  child: Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Watch',
          ),
          bottom: TabBar(
            tabs: [
              Text('Timer'),
              Text('StopWatch'),
            ],
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
            labelPadding: EdgeInsets.only(
              bottom: 10.0,
            ),
            unselectedLabelColor: Colors.white60,
          ),
        ),
        body: TabBarView(children: [
          timer(),
          Text('StopWatch'),
        ]),
      ),
    );
  }
}
