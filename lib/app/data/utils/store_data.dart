
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class StoreData{
  static String token = '';
  static String id = '';





  static void saveToken(value)  {
    box.write(UserDataKey.tokenKey, value);
  }

  static void saveId(value)  {
    box.write(UserDataKey.idKey, value);
  }

  StoreData._();
}

Future setUserTokenAndId()async {
  final box = GetStorage();
  final token = box.read(UserDataKey.tokenKey);
  final id = box.read(UserDataKey.idKey);
  if(token!=null) StoreData.token = token;
  if(id!=null) StoreData.id = token;
}
