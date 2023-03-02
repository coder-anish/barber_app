import 'package:objectbox/objectbox.dart';


@Entity()
class User {
  @Id(assignable: true)
  int stdId;
  String? fname;
  String? lname;
  String? username;
  String? password;
  String? email;
  User(this.fname, this.lname, this.username, this.password, this.email,
      {this.stdId = 0});
}