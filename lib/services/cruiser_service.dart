import 'package:briz/models/base.dart';
import 'package:briz/models/cruiser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CruiserDataService {
  static Future<List<Cruiser>> readAll() async {
    CollectionReference collection = FirebaseFirestore.instance.collection("cruisers");
    QuerySnapshot all = await collection.get();
    return Future.wait(
      all.docs.map(
        (object) async => Cruiser.fromDocumentSnapshot(object),
      ),
    );
  }

  static Future<Base> getBase(String id) async {
    var documentSnapshot = await FirebaseFirestore.instance.collection("bases").doc(id).get();
    return Base.fromDocumentSnapshot(documentSnapshot);
  }
}
