import 'package:cybershop/models/userModel.dart';
import 'package:cybershop/repository/productRepository.dart';
import 'package:cybershop/repository/reviewReposiory.dart';
import 'package:cybershop/repository/userRepository.dart';
import 'package:cybershop/response/productResponse.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  UserRepository? userRepository;
  group("test user register and login", () {
    setUp(() {
      userRepository = UserRepository();
    });
    test("user login test", () async {
      bool expectedResult = false;
      String email = "test@gmail.com";
      String password = "test";
      User user = User(email: email, password: password);
      bool actual = await UserRepository().loginUser(user);
      expect(actual, expectedResult);
    });

    test("get all product", () async {
      bool expectedResult = true;
      ProductResponse? actial = await ProductRepository().getproducts("havit");
      expect(actial!.success, expectedResult);
    });

    test("user change password", () async {
      bool expectedResult = true;
      String oldPassword = "gg123456@";
      String newPassword = "aa1223456@";
      String passwordConfirm = "aa1223456@";

      bool actial = await UserRepository()
          .changePassword(oldPassword, newPassword, passwordConfirm);

      expect(actial, expectedResult);
    });

    test("user register test", () async {
      bool expectedResult = true;
      String name = "test silwal";
      String email = "testyjhh88@gmail.com";
      String password = "test12349";
      User user = User(name: name, email: email, password: password);
      bool actual = await UserRepository().registerUser(user);
      expect(actual, expectedResult);
    });

    test("user products test", () async {
      bool expectedResult = true;
      String productId = "64006c703723af1243ee5535";
      String comment = "goddd";
      int rating = 2;

      bool actial =
          await ReviewRepository().addReview(productId, rating, comment);

      expect(actial, expectedResult);
    });
  });
}
