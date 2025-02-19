import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final userModels = await remoteDataSource.fetchUsers();

      return userModels.map((userModel) {
        return User(
          name: userModel.name,
          email: userModel.email,
          avatar: userModel.avatar,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
