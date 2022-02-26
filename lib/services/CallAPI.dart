import 'package:fluttermusic/models/AlbumsModel.dart';
import 'package:http/http.dart' as http;

class CallAPI {

  // กำหนด header ของ api
  _setHeaders() => {
    'Content-Type':'application/json',
    'Accept': 'application/json'
  };

  // กำหนด URL ของ API
  static const String baseAPIURL = "https://www.itgenius.co.th/sandbox_api/fluttermusicapi/";
  
   // Read Albums ทั้งหมด
  Future<List<AlbumsModel>?> getAlbums(album) async {
    final response = await http.get(
      Uri.parse(baseAPIURL+album),
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