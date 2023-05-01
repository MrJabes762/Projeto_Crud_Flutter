import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class Userform extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Usuario'),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3){
                    return 'Nome muito pequeno. No minimo 3 letras';
                  }
                  
                  return null;
                },
                onSaved: (value) {
                  print(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL do Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
