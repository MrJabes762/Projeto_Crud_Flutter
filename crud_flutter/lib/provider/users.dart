import 'dart:math';

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

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    }

    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
        '1000',
        () => User(
              id: id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl,
            ));

    notifyListeners();
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

}
