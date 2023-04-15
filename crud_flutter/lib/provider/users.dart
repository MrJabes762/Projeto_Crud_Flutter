import 'package:flutter/material.dart';
import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/data/dummy_users.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}
