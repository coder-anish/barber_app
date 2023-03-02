 import 'package:barber_app/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:barber_app/models/users.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test ('User should be able to login', () async{
    int expectedResult = 1;
    int actualResult = 
        await UserRemoteDataSource().login("anish@gmail.com", "anish");

    expect(actualResult, expectedResult);    
  });

  test ('User should be able to register', () async{
    int expectedResult = 1;
    User user = User("anish", "nice", "anish123", "passowrd", "anish@gmail.com");
    int actualResult = 
        await UserRemoteDataSource().register(user);

    expect(actualResult, expectedResult);    
  });
}