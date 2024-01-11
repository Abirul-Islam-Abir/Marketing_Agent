
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class StoreData{
  static String token = '';
  static String id = '';
  static String number = '';
  static String password = '';





  static void saveToken(value)  {
    box.write(UserDataKey.tokenKey, value);
  }

  static void saveId(value)  {
    box.write(UserDataKey.idKey, value);
  }
  static void saveNumber(value)  {
    box.write(UserDataKey.numberKey, value);
  }
  static void savePassword(value)  {
    box.write(UserDataKey.passwordKey, value);
  }
  StoreData._();
}

Future setUserTokenAndId()async {
  final box = GetStorage();
  final token = box.read(UserDataKey.tokenKey);
  if(token!=null) StoreData.token = token;
}
Future setNumberAndPassword()async {
  final box = GetStorage();
  final number = box.read(UserDataKey.numberKey);
  final password = box.read(UserDataKey.passwordKey);
  if(number!=null) StoreData.number = number;
  if(password!=null) StoreData.password = password;
}