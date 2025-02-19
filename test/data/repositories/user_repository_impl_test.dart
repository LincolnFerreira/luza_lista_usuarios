import 'package:flutter_test/flutter_test.dart';
import 'package:luza_lista_usuarios/data/models/user_model.dart';
import 'package:luza_lista_usuarios/domain/entities/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:luza_lista_usuarios/data/repositories/user_repository_impl.dart';
import 'package:luza_lista_usuarios/data/datasources/user_remote_data_source.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserRemoteDataSource])
void main() {
  late UserRepositoryImpl userRepository;
  late MockUserRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    userRepository = UserRepositoryImpl(mockRemoteDataSource);
  });

  group('UserRepositoryImpl', () {
    test('Deve retornar uma lista de usuários ao chamar getUsers com sucesso',
        () async {
      final userModels = [
        UserModel(
          name: 'Alice',
          email: 'alice@example.com',
          avatar: 'https://i.pravatar.cc/150?img=1',
        ),
        UserModel(
          name: 'Bob',
          email: 'bob@example.com',
          avatar: 'https://i.pravatar.cc/150?img=2',
        ),
      ];

      when(mockRemoteDataSource.fetchUsers())
          .thenAnswer((_) async => userModels);

      final result = await userRepository.getUsers();

      expect(result, isA<List<User>>());
      expect(result[0].name, 'Alice');
      expect(result[1].email, 'bob@example.com');

      verify(mockRemoteDataSource.fetchUsers()).called(1);
    });

    test('Deve lançar uma exceção ao chamar getUsers quando ocorrer um erro',
        () async {
      when(mockRemoteDataSource.fetchUsers())
          .thenThrow(Exception('Erro ao carregar usuários'));

      expect(() => userRepository.getUsers(), throwsException);

      verify(mockRemoteDataSource.fetchUsers()).called(1);
    });
  });
}
