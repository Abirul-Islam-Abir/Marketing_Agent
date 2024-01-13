import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class StoreData {

  static Future saveToken(value)async {
    box.write(UserDataKey.tokenKey, value);
  }

  static Future saveId(value) async{
    box.write(UserDataKey.idKey, value);
  }

  StoreData._();
}
