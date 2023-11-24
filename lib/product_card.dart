import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String titles;
  final double prices;
  final Color background;

  final String Companys;
  final String images;
  const ProductCard(
      {super.key,
      required this.background,
      required this.titles,
      required this.id,
      required this.prices,
      required this.Companys,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titles,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$$prices',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Image.asset(
              images,
              height: 175,
            ),
          )
        ],
      ),
    );
  }
}
