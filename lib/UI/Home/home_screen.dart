import 'package:flutter/material.dart';
import 'package:news_app/Categories/category.dart';
import 'package:news_app/Categories/category_details.dart';
import 'package:news_app/News/news_search.dart';
import 'package:news_app/Settings/settings_fragment.dart';
import 'package:news_app/UI/Home/home_drawer.dart';

import '../../Categories/categories_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    selectedWidget = CategoryFragment(onCategoryItemClicked);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/bg.png"),fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate:NewsSearch());
            }, icon: Icon(Icons.search,size: 25,color: Colors.white,))
          ],
        ),
        drawer: HomeDrawer(onClicked: onMenuClicked,),
        body: selectedWidget,
      ),
    );
  }

late Widget selectedWidget ;

  onMenuClicked( MenuItem item){
    Navigator.pop(context);
   switch(item){
     case MenuItem.categories:{
       selectedWidget = CategoryFragment(onCategoryItemClicked);
     }
     case MenuItem.settings:{
       selectedWidget = SettingsFragment();
     }
   }
   setState(() {});
  }
  onCategoryItemClicked(Category category){
    selectedWidget = CategoryDetails(category);
    setState(() {

    });
  }
}
