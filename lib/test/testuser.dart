import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dev/model/Resep.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_dev/model/user.dart';

class MockUser extends Mock implements user {}

void main() {
  group('User', () {
    final instance = FakeFirebaseFirestore();
    final userdoc = instance.collection('user').doc('testId');
    final resepdoc = instance.collection('resep').doc('testResepId');
    final testUser = user(
        id_user: 'testId',
        username: 'testUser',
        email: 'testEmail',
        tipe_user: 'testType');
    final testResep = Resep(id: 'testResepId');

    test('fetchuser', () async {
      await userdoc.set({
        'username': 'testUser',
        'email': 'testEmail',
        'tipe_user': 'testType',
      });

      testUser.fetchuser('testId');

      expect(testUser.username, 'testUser');
      expect(testUser.email, 'testEmail');
      expect(testUser.tipe_user, 'testType');
    });

    test('addbookmark', () async {
      testUser.addbookmark(testResep);
      verify(userdoc.update({
        "bookmark": FieldValue.arrayUnion([resepdoc])
      }));
      expect(testUser.bookmark, contains(resepdoc));
    });

    test('fetchbookmark', () async {
      await userdoc.set({
        'bookmark': [resepdoc],
      });

      testUser.fetchbookmark('testId');

      expect(testUser.bookmark, contains(resepdoc));
    });

    test('removebookmark', () async {
      // Add the bookmark first
      testUser.addbookmark(testResep);
      expect(testUser.bookmark, contains(resepdoc));

      // Now remove the bookmark
      testUser.removebookmark(testResep);
      verify(userdoc.update({
        "bookmark": FieldValue.arrayRemove([resepdoc])
      }));
      expect(testUser.bookmark, isNot(contains(resepdoc)));
    });

    // Add more tests as needed
  });
}
