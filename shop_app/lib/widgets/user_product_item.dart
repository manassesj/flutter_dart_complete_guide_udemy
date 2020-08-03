import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../screen/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const UserProductItem({this.title, this.imageUrl, this.id});

  @override
  Widget build(BuildContext context) {

    final scaffoldContext = Scaffold.of(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(title),
        trailing: Container(
          width: 100.0,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: id,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                color: Theme.of(context).errorColor,
                onPressed: () async {
                  try {
                    await Provider.of<Products>(context, listen: false)
                        .deleteProduct(id);
                  } catch (e) {
                    scaffoldContext.showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
