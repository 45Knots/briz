import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'cruiser.freezed.dart';
part 'cruiser.g.dart';

@freezed
class Cruiser with _$Cruiser {
  const factory Cruiser({
    required String id,
    required String title,
    required String type,
    @Default(0) int capacity,
    @Default("") String description,
    @Default("") String defaultImage,
  }) = _Cruiser;

  factory Cruiser.fromJson(Map<String, Object?> json) => _$CruiserFromJson(json);
  static Future<Cruiser> fromDocumentSnapshot(DocumentSnapshot documentSnapshot) async {
    final Map<String, dynamic> parsed = {"id": documentSnapshot.id, ...documentSnapshot.data() as Map<String, dynamic>};
    parsed["defaultImage"] = await FirebaseStorage.instance.refFromURL(parsed["defaultImage"]).getDownloadURL();
    return Cruiser.fromJson(parsed);
  }
}
