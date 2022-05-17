import 'package:flutter/material.dart';
import 'package:fluttermusic/services/CallAPI.dart';
import 'package:fluttermusic/models/AlbumsModel.dart';

class AllSongScreen extends StatefulWidget {
  AllSongScreen({Key? key}) : super(key: key);

  @override
  State<AllSongScreen> createState() => _AllSongScreenState();
}

class _AllSongScreenState extends State<AllSongScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'เพลงทั้งหมด',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder(
          future: CallAPI().getAllSongs(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AlbumsModel>?> snapshot) {
            if (snapshot.hasError) {
              // ถ้าโหลดข้อมูลไม่ได้ หรือมีข้อผิดพลาด
              return Container();
            } else if (snapshot.connectionState == ConnectionState.done) {
              // ถ้าโหลดข้อมูลสำเร็จ
              List<AlbumsModel>? albums = snapshot.data;
              return _listViewAllSongs(albums!);
            } else {
              // ระหว่างที่กำหลังโหลดข้อมูล สามารถใส่ loading...
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  // --------------------------------------------
  // สร้าง ListView สำหรับการแสดง Song ทั้งหมด
  // -------------------------------------------
  Widget _listViewAllSongs(List<AlbumsModel> songs) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: songs.length,
          itemBuilder: (context, index) {
            AlbumsModel albumsModel = songs[index];

            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Container(
                child: InkWell(
                  onTap: () {
                    // กดลิงก์บนอัลบั้มแล้วไปเปิดหน้า player_screen
                    Navigator.pushNamed(context, '/player', arguments: {
                      'coverurl': albumsModel.coverurl,
                      'albumname': albumsModel.albumname,
                      'singername': albumsModel.singername,
                      'songurl': albumsModel.songurl
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          child: Image.network(
                            albumsModel.coverurl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            albumsModel.albumname,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            albumsModel.singername,
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
            );
          }),
    );
  }
}
