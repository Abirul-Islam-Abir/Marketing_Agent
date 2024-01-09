
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class StoreData{
  static String token = '';





  static void storeToken(value)  {
    box.write(UserDataKey.tokenKey, value);
  }



  StoreData._();
}

Future getUserToken()async {
  final box = GetStorage();
  final token = box.read(UserDataKey.tokenKey);
  StoreData.token = token;
}
