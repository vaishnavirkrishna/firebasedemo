import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenController {
  CollectionReference employeesCollection =
      FirebaseFirestore.instance.collection('employees');
  addData(String newName) {
    employeesCollection.add({"name": newName});
  }

  editData({required String docId, required String updatednewName}) {
    employeesCollection.doc(docId).update({"name": updatednewName});
  }

  deleteData({required String docId}) {
    employeesCollection.doc(docId).delete();
  }
}
