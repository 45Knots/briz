import 'package:briz/models/cruiser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CruiserService {
  static Future<List<Cruiser>> readAll() async {
    CollectionReference collection = FirebaseFirestore.instance.collection("cruisers");
    QuerySnapshot all = await collection.get();
    return Future.wait(all.docs.map((object) => Cruiser.fromDocumentSnapshot(object)));
  }
}
