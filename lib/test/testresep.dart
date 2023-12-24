import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dev/model/Resep.dart';

class MockResep extends Mock implements Resep {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

void main() {
  group('Resep', () {
    final mockFirestore = MockFirebaseFirestore();
    final mockResepCollection = MockCollectionReference();
    final mockResepDoc = MockDocumentReference();
    final testResep = Resep(
        id: 'testResepId',
        Nama_Masakan: 'testResep',
        Budget: 100,
        Cara_Membuat: 'testCara',
        Deskripsi_Masakan: 'testDeskripsi',
        Bahan: 'testBahan',
        image: 'testImage',
        Verifikasi: false,
        bintang: 0,
        enak: 0,
        murah: 0,
        praktis: 0);

    setUp(() {
      when(mockFirestore.collection('resep')).thenReturn(
          mockResepCollection as CollectionReference<Map<String, dynamic>>);
      when(mockResepCollection.doc(any)).thenReturn(mockResepDoc);
    });

    test('uploadResep', () async {
      await testResep.uploadResep(
          judul: 'testResep',
          harga: 100,
          bahan: 'testBahan',
          cara: 'testCara',
          uid: 'testUid',
          image: 'testImage');

      verify(mockResepCollection.add({
        'bahan': 'testBahan',
        'harga': 100,
        'cara_membuat': 'testCara',
        'pembuat': 'testUid',
        'judul': 'TESTRESEP',
        'verifikasi': false,
        'bintang': 0.0,
        'enak': 0,
        'murah': 0,
        'praktis': 0,
        'image': 'testImage'
      }));
    });

    // Add more tests as needed
  });
}
