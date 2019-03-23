import 'package:flutter/material.dart';
import 'package:instagram_clone/insta_stories.dart';
import 'package:instagram_clone/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstaList extends StatelessWidget {

  final testElements = new ContentDetails(); // Imported from api.dart for content details

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    testElements.reset();
    return new ListView.builder(
      itemCount: 7, // The number of contents you want to display on the screen.
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
            //1st Row
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
          //2nd Row
          Flexible(
              fit: FlexFit.loose,
              child: new Image.network(
                  testElements.postImage(),
                fit: BoxFit.cover,
              )
          ),
          //3rd Row
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Icon(
                      FontAwesomeIcons.heart,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Icon(
                      FontAwesomeIcons.comment,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Icon(
                      FontAwesomeIcons.paperPlane,
                    )
                  ],
                ),
                Icon(
                  FontAwesomeIcons.bookmark,
                )
              ],
            ),
          ),
          //4th Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "liked by Alex, Martha and 56,234 others",
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          //5th Row
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                        image: NetworkImage("https://pbs.twimg.com/profile_images/1051159405830393856/xJH7ImpY_400x400.jpg"
                        ),
                    ),
                  ),
                ),
                new SizedBox(
                  width: 12.0,
                ),
                Expanded(
                    child: TextField(
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add a comment...",
                      ),
                    )
                )
              ],
            ),
          ),
          //6th Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Posted ${testElements.postedOn()} days ago...",
            style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
