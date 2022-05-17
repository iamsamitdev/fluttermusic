import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CollectionScreen extends StatelessWidget {
  // const CollectionScreen({Key? key}) : super(key: key);

  List<String> CoverList = [
    "https://i.pinimg.com/originals/f5/82/47/f58247463e38a536f442bfb816f62c6b.jpg",
    "https://www.designformusic.com/wp-content/uploads/2016/09/electro-synthwave-album-cover-500x500.jpg",
    "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/102342461/original/68ef1e1fab3c4028d51f7fd7cfa9bad2232e576c/create-a-copyright-free-album-cover.jpg",
    "https://www.designformusic.com/wp-content/uploads/2016/02/volta-music-trailer-music-album-cover-design.jpg",
    "https://www.designformusic.com/wp-content/uploads/2018/07/Digital-World-album-cover-design.jpg",
    "https://www.designformusic.com/wp-content/uploads/2016/02/volta-music-trailer-music-album-cover-design.jpg"
  ];

  Widget ListItem(String CoverUrl, String AlbumTitle, String SingerName) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.network(CoverUrl, fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AlbumTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      SingerName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w100),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text(
              "เพลงโปรดที่คุณเลือกไว้",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListItem(CoverList[0], "Earth Song", "Micheal Jackson"),
                  ListItem(CoverList[1], "Who Is It", "Dan Brown"),
                  ListItem(CoverList[2], "Remember me", "M2M 2002"),
                  ListItem(CoverList[3], "Better ma", "Michele rock"),
                  ListItem(CoverList[4], "Will You Be There", "Rolling Stone"),
                  ListItem(CoverList[5], "Dancing Machine", "Moonwalk"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
