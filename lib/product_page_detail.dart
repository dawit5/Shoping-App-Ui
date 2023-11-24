import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart_provider.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selected = 0;

  void ontap() {
    if (selected != 0) {
      Provider.of<CartProvider>(context, listen: false).addproduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selected,
        },
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('You Added Sucessesfuly')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please Insert the size ')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Details')),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(241, 242, 242, 1),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      '\$${widget.product['prices']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['size'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['size'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = size;
                              });
                            },
                            child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selected == size
                                    ? Theme.of(context).primaryColor
                                    : null),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: ontap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        minimumSize: Size(320, 50),
                      ),
                      child: const Text(
                        'Add Cart',
                        style: TextStyle(
                          color: Color.fromRGBO(1, 1, 1, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
