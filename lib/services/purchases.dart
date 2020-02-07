import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mastering_payments/models/purchase.dart';
import 'package:mastering_payments/models/user.dart';

class PurchaseServices{
  static const CUSTOMER_ID = 'customerId';

  String collection = "purchases";
  Firestore _firestore = Firestore.instance;

  void createPurchase(Map<String, dynamic> values){
    _firestore.collection(collection).document(values["id"]).setData(values);
  }

 Future<List<PurchaseModel>> getPurchaseHistory({String customerId})async =>
   _firestore.collection(collection).where(CUSTOMER_ID, isEqualTo: customerId).getDocuments().then((result){
   List<PurchaseModel> listOfPurchases = [];
     result.documents.map((item){
       listOfPurchases.add(PurchaseModel.fromSnapshot(item));
     });
     return listOfPurchases;
   });


//  void updateDetails(Map<String, dynamic> values){
//    _firestore.collection(collection).document(values["id"]).updateData(values);
//  }


//  Future<UserModel> getPurchaseById(String id) =>
//      _firestore.collection(collection).document(id).get().then((doc){
//        return PurchaseModel.fromSnapshot(doc);
//      });
}