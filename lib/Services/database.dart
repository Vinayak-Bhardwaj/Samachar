import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samachar/Models/custom_user_data.dart';
import 'package:samachar/Models/customized_user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData(String? name, String? emailId, String? phoneNo,
      String? newsSubscription) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'emailId': emailId,
      'phoneNo': phoneNo,
      'newsSubscription': newsSubscription,
    });
  }

  CustomUserData customUserDataFromSnapshot(DocumentSnapshot snapshot) {
    var data = (snapshot.data() as Map<String,dynamic>);
    return CustomUserData(
      uid: uid,
      //name: snapshot['name'],
      name: data['name'],
      phoneNumber: data['phoneNo'],
      emailId: data['emailId'],
      newsSubscription: data['newsSubscription'] ?? 'none',
      //imageurl: snapshot['ima']
    );
  }
  
  
  Stream<CustomUserData> get customUserData {
    return userCollection.doc(uid).snapshots().map(customUserDataFromSnapshot);
  }


}