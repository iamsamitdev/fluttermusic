import 'package:fluttermusic/models/AlbumsModel.dart';
import 'package:http/http.dart' as http;

class CallAPI {

  // กำหนด header ของ api
  _setHeaders() => {
    'Content-Type':'application/json',
    'Accept': 'application/json'
  };

  // กำหนด URL ของ API
  static const String baseAPIURL = "http://192.168.1.49/musicapi/public/api/";
  
   // Read Albums ทั้งหมด
  Future<List<AlbumsModel>?> getAlbums(typeid) async {
    final response = await http.get(
      Uri.parse(baseAPIURL+'albums/'+typeid),
      headers: _setHeaders()
    );
    // ignore: unnecessary_null_comparison
    if(response.body != null){
      return albumsModelFromJson(response.body);
    }else{
      return null;
    }
  }

}