import 'package:flutter/material.dart';
import 'package:instagram_clone/insta_body.dart';
import 'package:instagram_clone/insta_list.dart';

class InstaHome extends StatelessWidget {

  final topBar = new AppBar(
    backgroundColor: new Color(0xfefefe),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt, size: 34.0),
    title: SizedBox(
      height: 42.0, child: Image.asset("assets/images/insta_logo.png")
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: new RotationTransition(
            turns: new AlwaysStoppedAnimation(315/360),
            child: Icon(Icons.send, size: 28.0,))
        //child: Icon(Icons.send),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: new InstaBody(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(icon: Icon(Icons.home), onPressed: () => InstaList().build(context)),
              new IconButton(icon: Icon(Icons.search), onPressed: null),
              new IconButton(icon: Icon(Icons.add_box), onPressed: null),
              new IconButton(icon: Icon(Icons.favorite), onPressed: null),
              new IconButton(icon: Icon(Icons.contacts), onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
