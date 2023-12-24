import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_dev/model/user.dart';

class MockUser extends Mock implements user {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('User', () {
    final mockFirestore = MockFirebaseFirestore();
    final mockUserCollection = MockCollectionReference();
    final mockUserDoc = MockDocumentReference();
    final mockResepCollection = MockCollectionReference();
    final mockResepDoc = MockDocumentReference();
    final mockUserSnapshot = MockDocumentSnapshot();
    final testUser = user(
        id_user: 'testId',
        username: 'testUser',
        email: 'testEmail',
        tipe_user: 'testType');
    final testResep = Resep(id: 'testResepId');

    setUp(() {
      when(mockFirestore.collection('user')).thenReturn(
          mockUserCollection as CollectionReference<Map<String, dynamic>>);
      when(mockUserCollection.doc(any)).thenReturn(mockUserDoc);
      when(mockFirestore.collection('resep')).thenReturn(
          mockResepCollection as CollectionReference<Map<String, dynamic>>);
      when(mockResepCollection.doc(any)).thenReturn(mockResepDoc);
      when(mockUserDoc.get()).thenAnswer((_) async => mockUserSnapshot);
      when(mockUserSnapshot.exists).thenReturn(true);
      when(mockUserSnapshot.data()).thenReturn({
        'username': 'testUser',
        'email': 'testEmail',
        'tipe_user': 'testType',
        'bookmark': [mockResepDoc],
      });
    });

    test('fetchuser', () async {
      testUser.fetchuser('testId');

      verify(mockUserDoc.get());
      expect(testUser.username, 'testUser');
      expect(testUser.email, 'testEmail');
      expect(testUser.tipe_user, 'testType');
    });

    // Add more tests as needed
  });
}
