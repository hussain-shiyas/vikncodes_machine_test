import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:vikncodes_machine_test/ui/sales_list_screen/domain/model/sales_list_res_model.dart';

enum MainBoxKeys {
  token,
  userId,
  salesList,
  profileData,
  loginData,
}

mixin class StorageServiceMixin {
  static late Box? mainBox;
  static const _boxName = 'localData';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SalesListResModelAdapter());
    Hive.registerAdapter(SalesDataAdapter());
    mainBox = await Hive.openBox(_boxName);
  }

  Future<void> addData<T>(MainBoxKeys key, T value) async {
    await mainBox?.put(key.name, value);
  }

  Future<void> removeData(MainBoxKeys key) async {
    await mainBox?.delete(key.name);
  }

  T getData<T>(MainBoxKeys key) => mainBox?.get(key.name) as T;

  Future<void> closeBox() async {
    try {
      if (mainBox != null) {
        await mainBox?.close();
        await mainBox?.deleteFromDisk();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void clearData() async {
    removeData(MainBoxKeys.userId);
    removeData(MainBoxKeys.token);
  }
}
