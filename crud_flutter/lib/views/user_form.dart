import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class Userform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Usuario'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column (
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration (labelText: 'Nome'),
              ),
              TextFormField(
                decoration: InputDecoration (labelText: 'Email'),
              ),
              TextFormField(
                decoration: InputDecoration (labelText: 'URL do Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
