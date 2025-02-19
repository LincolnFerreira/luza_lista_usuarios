// test/user_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:luza_lista_usuarios/domain/entities/user.dart';

void main() {
  group('User Entity', () {
    test('should create a User with the given properties', () {
      const name = 'Alice';
      const email = 'alice@example.com';
      const avatar = 'https://example.com/alice.jpg';

      final user = User(name: name, email: email, avatar: avatar);

      expect(user.name, equals(name));
      expect(user.email, equals(email));
      expect(user.avatar, equals(avatar));
    });
  });
}
