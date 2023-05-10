import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/models/user.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icon.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              color: Color.orange,
              icon: Icon(Icon.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (ctx) => AlertDialog(
                  title: Text ('Excluir Usuário'),
                  content: Text('Tem certeza ???'),
                  actions: <Widget> [ 
                    FlatButton (
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                    FlatButton (
                      child: Text('Sim'),
                      onPressed: () {
                        Provider.of<Users>(context, listen: false).remove(user);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  ),
                );
              },
              color: Color.red,
              icon: Icon(Icon.delete),
            ),
          ],
        ),
      ),
    );
  }
}
