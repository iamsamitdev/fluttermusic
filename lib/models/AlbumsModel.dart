// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';

List<AlbumsModel> albumsModelFromJson(String str) => List<AlbumsModel>.from(json.decode(str).map((x) => AlbumsModel.fromJson(x)));

String albumsModelToJson(List<AlbumsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsModel {
    AlbumsModel({
        required this.id,
        required this.coverurl,
        required this.albumname,
        required this.singername,
        required this.albumtype,
        required this.createdAt,
        required this.updatedAt,
        required this.status,
    });

    String id;
    String coverurl;
    String albumname;
    String singername;
    String albumtype;
    DateTime? createdAt;
    DateTime? updatedAt;
    String status;

    factory AlbumsModel.fromJson(Map<String, dynamic> json) => AlbumsModel(
        id: json["id"] == null ? null : json["id"],
        coverurl: json["coverurl"] == null ? null : json["coverurl"],
        albumname: json["albumname"] == null ? null : json["albumname"],
        singername: json["singername"] == null ? null : json["singername"],
        albumtype: json["albumtype"] == null ? null : json["albumtype"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "coverurl": coverurl == null ? null : coverurl,
        "albumname": albumname == null ? null : albumname,
        "singername": singername == null ? null : singername,
        "albumtype": albumtype == null ? null : albumtype,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "status": status == null ? null : status,
    };
}
