
import 'dart:core';

import 'package:barber_app/data_source/local_data_source/user_data_source.dart';
import 'package:barber_app/data_source/remote_data_source/user_remote_data_source.dart';

import '../models/users.dart';

abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<int> addUser(User user);
  Future<int> signUp(String username, String password);


}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(User user) {
    return UserRemoteDataSource().register(user);
  }

  @override
  Future<List<User>> getAllUser() {
    return UserDataSource().getUser();
  }
  
  @override
  Future<int> signUp(String username, String password) {
    return UserRemoteDataSource().login(username, password);
  }

}