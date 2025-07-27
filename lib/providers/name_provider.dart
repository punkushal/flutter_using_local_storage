import 'package:flutter/material.dart';
import 'package:notes_using_local_storage/services/storage_service.dart';

class NameProvider extends ChangeNotifier {
  String? _name;
  final service = StorageService();

  String? get name => _name;

  Future<void> save(String name) async {
    await service.saveName(name);
    await getName();
  }

  Future<void> getName() async {
    _name = await service.getName();
    notifyListeners();
  }
}
