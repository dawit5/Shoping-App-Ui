import 'package:flutter/material.dart';

import 'global_variable.dart';
import 'product_card.dart';
import 'product_page_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductList();
}

class _ProductList extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'AirForce ',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      child: Column( 
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Shoes\nCollection',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: border,
                    enabledBorder: border,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  String filter = filters[index];
                  return SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : Color.fromRGBO(255, 250, 250, 1),
                          side: const BorderSide(
                              color: Color.fromRGBO(216, 213, 213, 1)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          label: Text(
                            filter,
                          ),
                          labelStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final id = products[index]['id'] as int;
                final title = products[index]['title'] as String;
                final price = products[index]['prices'] as double;

                final company = products[index]['company'] as String;
                final images = products[index]['imageUrl'] as String;
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetail(product: product);
                    }));
                  },
                  child: ProductCard(
                    background: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : Color.fromARGB(255, 255, 255, 255),
                    id: id,
                    titles: '$title',
                    prices: price,
                    Companys: '$company',
                    images: '$images',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
