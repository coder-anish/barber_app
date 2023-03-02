import 'package:barber_app/models/users.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<User> _user;
  // late final Box<Role> _role;

  ObjectBoxInstance(this._store) {
    _user = Box<User>(_store);
    // insertRoles();
  }

  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(getObjectBoxModel(), directory: '${dir.path}/users');
    return ObjectBoxInstance(store);
  }

  int addUser(User user) {
    return _user.put(user);
  }

  List<User> getAllUser() {
    return _user.getAll();
  }

  User? loginUser(String username, String password) {
    return _user
        .query(
            User_.username.equals(username) & User_.password.equals(password))
        .build()
        .findFirst();
  }
}
