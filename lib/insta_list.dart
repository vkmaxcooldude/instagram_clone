import 'package:flutter/material.dart';
import 'package:instagram_clone/insta_stories.dart';

class InstaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new ListView.builder(
      itemCount: 5, // The number of stories you want to display on the screen
      itemBuilder: (context, index)=> index == 0 ? new SizedBox(
        child: new InstaStories(),
        height: deviceSize.height * 0.17,
      )
          : Column(

      ),
    );
  }
}
