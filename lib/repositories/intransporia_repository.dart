import 'dart:async';
import 'package:hive_flutter/adapters.dart';

abstract class BaseRepository {
  Future<Box<E>> setupBox<E>();
  Future<void> close();
  Future<void> clear();
}

class IntransporiaRepository implements BaseRepository {
  final String name;

  IntransporiaRepository(this.name);

  late Box box = Hive.box(name);

  @override
  Future<Box<E>> setupBox<E>() async {
    return await Hive.openBox<E>(
      name,
      encryptionCipher: HiveAesCipher(Hive.generateSecureKey()),
    );
  }

  Future<void> putData<E>(String key, E entries) async {
    return await box.put(key, entries);
  }

  Future<Map<String, dynamic>?> getData(String key) async {
    return box.get(key)?.cast<String, dynamic>();
  }

  Future<void> deleteData<E>(String key) async {
    return await box.delete(key);
  }

  @override
  Future<void> close() async {
    await box.close();
  }

  @override
  Future<int> clear() async {
    return await box.clear();
  }
}
