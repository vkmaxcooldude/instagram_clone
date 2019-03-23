import 'package:flutter/material.dart';
import 'package:instagram_clone/insta_stories.dart';
import 'package:instagram_clone/api.dart';

class InstaList extends StatelessWidget {

  final testElements = new ContentDetails(); // Imported from api.dart for content details

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    testElements.reset();
    return new ListView.builder(
      itemCount: 5, // The number of stories you want to display on the screen
      itemBuilder: (context, index)=> index == 0 ? new SizedBox(
        child: new InstaStories(),
        height: deviceSize.height * 0.17,
      )
      : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(testElements.ProfileImage())
                        ),
                      ),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text(
                      testElements.UserName(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                new IconButton(icon: Icon(Icons.more_vert),
                    onPressed: null)
              ],
            ),
          ),
          Flexible(
              fit: FlexFit.loose,
              child: new Image.network(
                  testElements.postImage(),
                fit: BoxFit.cover,
              )
          ),
        ],
      ),
    );
  }
}
