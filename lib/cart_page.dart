import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart_provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Cart',
            style: Theme.of(context).textTheme.titleLarge,
          )),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  cartItem['imageUrl'].toString(),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Product',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        content: const Text(
                          'Are you sure to delete the product',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeProduct(cartItem);
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('size :${cartItem['size']}'),
            );
          },
        ));
  }
}
