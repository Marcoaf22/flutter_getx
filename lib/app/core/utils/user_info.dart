import 'package:getx/app/data/model/auth.dart';
import 'package:getx/app/data/model/user.dart';

class UserInfo {
  UserInfo._();

  static UserInfo i = UserInfo._();

  late User user;
  User get value => user;

  Future<void> setValue() async {
    user = await Auth.instance.getUser();
  }
  // void clearValue() async {
  //   user = User;
  // }
}
