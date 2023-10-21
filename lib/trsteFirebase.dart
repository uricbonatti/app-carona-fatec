import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await Firebase.initializeApp();

// Obtém uma referência para a coleção
  CollectionReference users = FirebaseFirestore.instance.collection('Aluno');

// Obtém todos os documentos da coleção
  QuerySnapshot querySnapshot = await users.get();

  querySnapshot.docs.forEach((doc) {
    print(doc.data());
  });
}
