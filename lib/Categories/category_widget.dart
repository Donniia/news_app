import 'package:flutter/material.dart';
import 'package:news_app/Categories/category.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(28),
            topLeft: Radius.circular(28),
            bottomLeft: Radius.circular(index.isEven ? 28 : 0),
            bottomRight: Radius.circular(index.isOdd ? 28:0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('Assets/${category.imagePath}',height: 120,width: double.infinity,fit: BoxFit.fitHeight,),
          Text(
            category.title,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
