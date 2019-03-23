class ContentDetails {
  int ProfileImageIndex = 0;
  int UserNameIndex = 0;
  int postImageIndex = 0;
  int postedOnIndex = 0;

  void reset(){
    ProfileImageIndex = 0;
    UserNameIndex = 0;
    postImageIndex = 0;
    postedOnIndex = 0;
  }

  String ProfileImage(){
    var img = [
      "https://pbs.twimg.com/profile_images/1094044059822448640/BvJ8T3jO_400x400.jpg",
      "https://pbs.twimg.com/profile_images/1107923161729777665/MON6pwTP_400x400.jpg",
      "https://pbs.twimg.com/profile_images/768780297437450240/FJBOm5n8_400x400.jpg",
      "https://pbs.twimg.com/profile_images/597865661264596992/NnOqToId_400x400.jpg",
      "https://pbs.twimg.com/media/D2MzKObU8AAzOgL.jpg",
      "https://pbs.twimg.com/profile_images/988775660163252226/XpgonN0X_400x400.jpg",
      "https://pbs.twimg.com/profile_images/2504398687/344204969_400x400.jpg",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    return img[ProfileImageIndex++];
  }

  String UserName(){
    var name = [
      "mkbhd",
      "elonmusk",
      "srbachchan",
      "arrahman",
      "max__reeves",
      "billgates",
      "sachin_rt",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    return name[UserNameIndex++];
  }

  String postImage(){
    var img = [
      "https://pbs.twimg.com/media/D2Ta7TEWwAAOqZz.jpg",
      "https://pbs.twimg.com/media/D1rETaVUcAA_8-h.jpg",
      "https://pbs.twimg.com/media/D1zgS0DU4AEL2Kv.jpg",
      "https://pbs.twimg.com/media/D0_xJfxVYAENbO8.png",
      "https://pbs.twimg.com/media/D1zD6JyUkAAQJTD.jpg",
      "https://pbs.twimg.com/media/D191q3zWoAEwNVH.jpg",
      "https://pbs.twimg.com/media/D1l688rW0AEtk9o.jpg",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    return img[postImageIndex++];
  }
  int postedOn(){
    var dateAndTime = [
      "2019-01-29 09:42:10",
      "2019-01-29 09:37:01",
      "2018-07-31 04:42:26",
      "2018-06-25 10:41:34",
      "2018-05-25 10:40:08",
      "2018-05-25 10:36:01",
      "2018-05-24 01:55:17",
      "2018-05-24 01:25:12",
      "",
      "",
      "",
      "",
      "",
    ];

    var now = new DateTime.now();
    var difference = now.difference(DateTime.parse(dateAndTime[postedOnIndex++]));
    return difference.inDays;
  }
}