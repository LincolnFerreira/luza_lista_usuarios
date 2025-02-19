import 'package:flutter_test/flutter_test.dart';
import 'package:luza_lista_usuarios/domain/repositories/user_repository.dart';
import 'package:luza_lista_usuarios/domain/entities/user.dart';
import 'package:luza_lista_usuarios/domain/usecase/get_users.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_users_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late GetUsers getUsers;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUsers = GetUsers(mockUserRepository);
  });

  group('GetUsers UseCase', () {
    test('should return a list of users when repository call is successful',
        () async {
      final mockUsers = [
        User(
            name: 'Alice',
            email: 'alice@example.com',
            avatar: 'https://example.com/alice.jpg'),
        User(
            name: 'Bob',
            email: 'bob@example.com',
            avatar: 'https://example.com/bob.jpg'),
      ];

      when(mockUserRepository.getUsers()).thenAnswer((_) async => mockUsers);

      final result = await getUsers();

      expect(result, equals(mockUsers));
      verify(mockUserRepository.getUsers()).called(1);
    });

    test('should throw an exception when repository call fails', () async {
      when(mockUserRepository.getUsers())
          .thenThrow(Exception('Failed to fetch users'));

      expect(() => getUsers(), throwsA(isA<Exception>()));
      verify(mockUserRepository.getUsers()).called(1);
    });

    test('should return an empty list when no users are available', () async {
      when(mockUserRepository.getUsers()).thenAnswer((_) async => []);

      final result = await getUsers();

      expect(result, isEmpty);
      verify(mockUserRepository.getUsers()).called(1);
    });
  });
}
