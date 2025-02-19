import 'dart:async';

import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource({required this.dio});

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users');

      List<dynamic> data;
      if (response.data is List) {
        data = response.data;
      } else if (response.data is Map && response.data.containsKey('data')) {
        data = response.data['data'];
      } else {
        throw Exception('Formato de resposta inesperado');
      }

      return data.map((json) {
        return UserModel(
          name: json['name'],
          email: json['email'],
          avatar: 'https://i.pravatar.cc/150?img=${json['id']}',
        );
      }).toList();
    } catch (e) {
      throw Exception('Erro ao buscar usuários: $e');
    }
  }
}
