import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_dev/model/user.dart';
import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_dev/model/Resep.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  MockFirestore instance;
  setUp(() {
    instance = MockFirestore();
  })
  group('User Tests', () {
    test('fetchuser populates user data from Firestore', () async {
      final firestore = MockFirestore();
      final collectionReference = MockCollectionReference();
      final documentReference = MockDocumentReference();
      final documentSnapshot = MockDocumentSnapshot();

      when(firestore.collection('user')).thenReturn(
          collectionReference as CollectionReference<Map<String, dynamic>>);
      when(collectionReference.doc('userId')).thenReturn(documentReference);
      when(documentReference.get()).thenAnswer((_) async => documentSnapshot);
      when(documentSnapshot.exists).thenReturn(true);
      when(documentSnapshot.data()).thenReturn({
        'username': 'mockedUsername',
        'email': 'mockedEmail',
        'tipe_user': 'mockedUserType',
      });

      user users = user();
      users.fetchuser('"V6JPalsDWaNMQM6YgL8L0waL5u02"');

      expect(users.id_user, 'userId');
      expect(users.username, 'mockedUsername');
      expect(users.email, 'mockedEmail');
      expect(users.tipe_user, 'mockedUserType');
    });

    test('fetchuser handles Firestore errors', () async {
      final firestore = MockFirestore();
      final collectionReference = MockCollectionReference();
      final documentReference = MockDocumentReference();

      when(firestore.collection('user')).thenReturn(
          collectionReference as CollectionReference<Map<String, dynamic>>);
      when(collectionReference.doc('userId')).thenReturn(documentReference);
      when(documentReference.get()).thenThrow('Firestore error');

      user users = user();
      users.fetchuser('userId');

      expect(users.id_user, '');
      expect(users.username, '');
      expect(users.email, '');
      expect(users.tipe_user, '');
    });
  });
}
