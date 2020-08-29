import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Tab { a, b, c }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentTab = Tab.a;

  @override
  Widget build(BuildContext context) {
    Padding _buildSegmentTab(String title) {
      return Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(
          title,
        ),
      );
    }

    Widget _buildScreenSegment(Tab tab) {
      switch (tab) {
        case Tab.a:
          return Center(
            child: Text('A'),
          );
        case Tab.b:
          return Center(
            child: Text('B'),
          );
        case Tab.c:
          return Center(
            child: Text('C'),
          );
        default:
          return Placeholder();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          CupertinoSlidingSegmentedControl(
            children: {
              Tab.a: _buildSegmentTab('A'),
              Tab.b: _buildSegmentTab('B'),
              Tab.c: _buildSegmentTab('C'),
            },
            onValueChanged: (tab) => setState(() => _currentTab = tab),
            groupValue: _currentTab,
          ),
          _buildScreenSegment(_currentTab),
        ],
      ),
    );
  }
}
