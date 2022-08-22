import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/card.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  const CartItem(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      onDismissed: (direction) =>
          Provider.of<Cart>(context, listen: false).removeId(productId),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '\$$price',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            title: Text('$title'),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}