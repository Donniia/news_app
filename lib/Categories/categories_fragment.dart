import 'package:flutter/material.dart';
import 'package:news_app/Categories/category.dart';
import 'package:news_app/Categories/category_widget.dart';

typedef onCategoryClicked = void Function(Category category);
class CategoryFragment extends StatelessWidget {
  List<Category> categories = Category.getAllCategories();
  onCategoryClicked categoryClicked;
  CategoryFragment(this.categoryClicked);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding:const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick Your Category \n Of Interest',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
         const SizedBox(height: 25,),
          Expanded(
            child: GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,crossAxisSpacing: 15 ,mainAxisSpacing: 20 ),
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: (){
                      categoryClicked(categories[index]);
                    },
                      child: CategoryWidget(category: categories[index], index: index)),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
