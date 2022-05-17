import 'package:flutter/material.dart';
import 'package:fluttermusic/services/CallAPI.dart';
import 'package:fluttermusic/models/AlbumsModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 12.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'อัลบั้มแนะนำ',
                  style: TextStyle(fontSize: 22.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/allsong');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    primary: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  ),
                  child: Text('เพลงทั้งหมด',
                    style: TextStyle(
                    fontSize: 14.0,
                  )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          FutureBuilder(
            future: CallAPI().getAlbums('album1.json'),
            builder: (BuildContext context,
              AsyncSnapshot<List<AlbumsModel>?> snapshot) {
              if (snapshot.hasError) {
                // ถ้าโหลดข้อมูลไม่ได้ หรือมีข้อผิดพลาด
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done) {
                // ถ้าโหลดข้อมูลสำเร็จ
                List<AlbumsModel>? albums = snapshot.data;
                return _listViewAlbums(albums!);
              } else {
                // ระหว่างที่กำหลังโหลดข้อมูล สามารถใส่ loading...
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 12.0),
            child: Text(
              'อัลบั้มมาใหม่',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          FutureBuilder(
            future: CallAPI().getAlbums('album2.json'),
            builder: (BuildContext context,
              AsyncSnapshot<List<AlbumsModel>?> snapshot) {
              if (snapshot.hasError) {
                // ถ้าโหลดข้อมูลไม่ได้ หรือมีข้อผิดพลาด
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done) {
                // ถ้าโหลดข้อมูลสำเร็จ
                List<AlbumsModel>? albums = snapshot.data;
                return _listViewAlbums(albums!);
              } else {
                // ระหว่างที่กำหลังโหลดข้อมูล สามารถใส่ loading...
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 12.0),
            child: Text(
              'อัลบั้มฮิตตลอดกาล',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          FutureBuilder(
            future: CallAPI().getAlbums('album3.json'),
            builder: (BuildContext context,
              AsyncSnapshot<List<AlbumsModel>?> snapshot) {
              if (snapshot.hasError) {
                // ถ้าโหลดข้อมูลไม่ได้ หรือมีข้อผิดพลาด
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done) {
                // ถ้าโหลดข้อมูลสำเร็จ
                List<AlbumsModel>? albums = snapshot.data;
                return _listViewAlbums(albums!);
              } else {
                // ระหว่างที่กำหลังโหลดข้อมูล สามารถใส่ loading...
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
        ],
      ),
    );
  }

  // --------------------------------------------
  // สร้าง ListView สำหรับการแสดง albums
  // -------------------------------------------
  Widget _listViewAlbums(List<AlbumsModel> albums) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: albums.length,
        itemBuilder: (context, index) {

          AlbumsModel albumsModel = albums[index];
          
          return Container(
            child: InkWell(
              onTap: () {
                // กดลิงก์บนอัลบั้มแล้วไปเปิดหน้า player_screen
                Navigator.pushNamed(
                  context, 
                  '/player',
                  arguments: {
                    'coverurl': albumsModel.coverurl,
                    'albumname': albumsModel.albumname,
                    'singername': albumsModel.singername,
                    'songurl': albumsModel.songurl
                  }
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        height: 140.0,
                        width: 140.0,
                        child: Image.network(
                          albumsModel.coverurl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      albumsModel.albumname.length >= 10 ? albumsModel.albumname.substring(0,10)+"...": albumsModel.albumname,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      albumsModel.singername,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
