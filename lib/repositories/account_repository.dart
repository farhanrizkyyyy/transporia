import 'package:flutter/rendering.dart';
import 'package:intransporia/repositories/repositories.dart';

class AccountRepository {
  static AccountRepository? _singleton;
  String? _key;
  IntransporiaRepository? repository;

  factory AccountRepository() {
    _singleton ??= AccountRepository._internal();

    return _singleton!;
  }

  AccountRepository._internal() {
    repository = IntransporiaRepository('account');
    _key = 'entries';
  }

  // FIXME: Cant work properly
  Future setupBox() async {
    await repository!.setupBox<Map<String, dynamic>>();
  }

  Future<void> save(Map<String, dynamic> entries) async {
    await repository!.putData<Map<String, dynamic>>(_key!, entries);
  }

  Future<Map<String, dynamic>?> get() async {
    final entries = await repository!.getData(_key!);

    debugPrint(entries.toString());

    return entries;
  }

  Future<void> close() async {
    return await repository!.close();
  }

  Future<bool> exists() async {
    final Map<String, dynamic>? entries = await get();

    if (entries == null) {
      return false;
    }

    return true;
  }
}
