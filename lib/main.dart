import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

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
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
            child: FlipCard(
              key: cardKey,
              flipOnTouch: false,
              front: Center(
                child: RaisedButton(
                  onPressed: () => cardKey.currentState.toggleCard(),
                  child: Text('Click here to toggle'),
                ),
              ),
              back: Center(
                child: GestureDetector(
                  onTap: (){
                    cardKey.currentState.toggleCard();
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage("https://i.pinimg.com/236x/2f/c4/52/2fc452371efda167d27d8f886ff2673d.jpg"),
                  ),
                ),
              ),
            ),
      )
    );
  }
}
