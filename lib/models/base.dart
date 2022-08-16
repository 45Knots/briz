import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

@freezed
class Base {
  final String id;
  final String title;
  final GeoPoint location;
  final String logo;
  final String placeUrl;

  const Base({required this.id, required this.title, required this.location, this.logo = "", this.placeUrl = ""});

  factory Base.fromJson(Map<String, Object?> json) => Base(
        id: json['id'] as String,
        title: json['title'] as String,
        logo: json['logo'] as String? ?? "",
        placeUrl: json['place_url'] as String? ?? "",
        location: geoPointfromJson(
          (json['location'] as Map<String, dynamic>),
        ),
      );

  static Future<Base> fromDocumentSnapshot(DocumentSnapshot documentSnapshot) async {
    final Map<String, dynamic> parsed = {"id": documentSnapshot.id, ...documentSnapshot.data() as Map<String, dynamic>};
    try {
      parsed["logo"] = await FirebaseStorage.instance.refFromURL(parsed["logo"]).getDownloadURL();
    } catch (on) {
      parsed["logo"] = "";
    }

    return Base.fromJson(parsed);
  }

  static geoPointfromJson(Map<String, dynamic> json) => GeoPoint(json["_latitude"], json["_longitude"]);
}
