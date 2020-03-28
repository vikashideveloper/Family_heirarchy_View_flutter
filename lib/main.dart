import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
import 'package:family_tree/FamilyTreeView.dart';
import 'package:family_tree/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  Person rootPerson;

  @override
  void initState() {
    super.initState();
    // prepare root member of heirarchy
    rootPerson = dummyFamily();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: BidirectionalScrollViewPlugin(
            child: Container(
              // Use of Family Tree widget. Have to pass the Root family member
              child: FamilyTreeWidget(
                person: rootPerson,
                isRootNode: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
