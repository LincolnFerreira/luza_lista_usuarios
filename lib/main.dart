import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/datasources/user_remote_data_source.dart';
import 'domain/repositories/user_repository.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/usecase/get_users.dart';
import 'presentation/screen/user_list_screen.dart';

void main() {
  final dio = Dio();

  Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(UserRemoteDataSource(dio: dio)));

  Get.lazyPut(() => GetUsers(Get.find<UserRepository>()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'User List',
      theme: appTheme,
      home: UserListScreen(),
    );
  }
}

final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
