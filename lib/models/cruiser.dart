import 'package:briz/constants.dart';
import 'package:briz/models/base.dart';
import 'package:briz/services/cruiser_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CruiserService {
  final String title;
  final double price;
  final bool included;

  CruiserService({required this.title, required this.price, this.included = false});
}

class CruiserPrice {
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final double price;
  final double discount;

  CruiserPrice({this.dateFrom, this.dateTo, required this.price, this.discount = 0});
}

class Cruiser {
  Cruiser({
    required this.id,
    required this.title,
    required this.type,
    required this.capacity,
    required this.defaultImage,
    required this.cabins,
    required this.length,
    this.description,
    this.baseId,
    this.services = const [],
    this.prices = const [],
    this.imageFolder,
  });

  final String id;
  final String title;
  final String type;
  final int capacity;
  final String? description;
  final String defaultImage;
  final String? baseId;
  late Base base;
  final int cabins;
  final double length;
  final List<CruiserService> services;
  final List<CruiserPrice> prices;
  late List<String>? images;
  final String? imageFolder;

  factory Cruiser.fromJson(Map<String, Object?> json) => Cruiser(
        id: json['id'] as String,
        title: json['title'] as String,
        type: json['type'] as String,
        capacity: json['capacity'] as int? ?? 0,
        description: json['description'] as String? ?? "",
        defaultImage: json['defaultImage'] as String? ?? "",
        baseId: json['baseId'] as String? ?? "",
        cabins: json['cabins'] as int,
        length: double.parse(json['length'].toString()),
        imageFolder: json['imageFolder'] as String?,
        services: (json['services'] as List<dynamic>)
            .map((e) => CruiserService(
                  title: e["title"] as String,
                  price: double.parse(e["price"].toString()),
                  included: e["included"] as bool,
                ))
            .toList(),
        prices: [
          CruiserPrice(price: double.parse(json['price'].toString())),
        ],
      );

  static Future<Cruiser> fromDocumentSnapshot(DocumentSnapshot documentSnapshot) async {
    final Map<String, dynamic> parsed = {"id": documentSnapshot.id, ...documentSnapshot.data() as Map<String, dynamic>};
    try {
      parsed["defaultImage"] = await FirebaseStorage.instance.refFromURL(parsed["defaultImage"]).getDownloadURL();
    } catch (on) {
      parsed["defaultImage"] = Constants.defaultItemImagePath;
    }
    try {
      parsed["baseId"] = parsed["base"].id;
    } catch (on) {
      parsed["baseId"] = "";
    }

    var cruiser = Cruiser.fromJson(parsed);
    cruiser.base = await CruiserDataService.getBase(parsed["baseId"]);
    if (cruiser.imageFolder != null) {
      final query = await FirebaseStorage.instance.refFromURL(cruiser.imageFolder!).listAll();
      cruiser.images = await Future.wait(query.items.map((e) async => await e.getDownloadURL()).toList());
    }
    return cruiser;
  }
}
