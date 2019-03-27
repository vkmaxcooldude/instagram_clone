import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:instagram_clone/insta_stories.dart';
import 'package:instagram_clone/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class InstaList extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    counter = 0;
    return FutureBuilder(
        future: ContentDetails().fetchPost(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              throw Exception("Asynchronous Error");
            }
            ContentDetails testElements = ContentDetails.fromJson(
                json.decode(snapshot.data));
            return ListView.builder(
              itemCount: (testElements.data[0].id + 1), // The number of contents you want to display on the screen.
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
                                    image: new NetworkImage(testElements.data[counter].userDetails.userImage)
                                ),
                              ),
                            ),
                            new SizedBox(
                              width: 10.0,
                            ),
                            new Text(
                              testElements.data[counter].userDetails.fullName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        new IconButton(icon: Icon(Icons.more_vert),
                            onPressed: null)
                      ],
                    ),
                  ),
                  //2nd Row displaying photo or video
                  testElements.data[counter].mediaType == "photo" ? Flexible(
                      fit: FlexFit.loose,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: testElements.data[counter].imgURL,
                      ),
                  ) :
                  Flexible(
                    fit: FlexFit.loose,
                    child: Chewie(
                      controller: ChewieController(
                        videoPlayerController: VideoPlayerController.network(testElements.data[counter].imgURL),
                        allowFullScreen: false,
                        allowMuting: true,
                        fullScreenByDefault: false,
                        looping: true,
                        //placeholder: CircularProgressIndicator(),
                        showControls: true,
                        autoPlay: false,
                        aspectRatio: 16/9,
                      ),
                    ),
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
                    child: Text("Posted on ${testElements.data[counter++].postedOn}...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            );
          }
        },
    );
  }
}

