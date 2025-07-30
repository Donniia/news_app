import 'package:flutter/material.dart';

typedef onMenuItemClicked = void Function(MenuItem clickedItem);
class HomeDrawer extends StatelessWidget {
  onMenuItemClicked onClicked;
  HomeDrawer({required this.onClicked,super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: 320,
              height: 110,
              color: theme.primaryColor,
              alignment: Alignment.center,
              child: Text("News App!",style:theme.textTheme.titleLarge ,),
            ),
            InkWell(
              onTap: (){
              onClicked(MenuItem.categories);
              },
              child: Row(children: [
                const Icon(Icons.list,color:Color(0xff303030),size: 32,),
                const SizedBox(width: 8,),
                Text("Categories",style:theme.textTheme.titleLarge!.copyWith(color:const Color(0xff303030) ), )
              ],),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                onClicked(MenuItem.settings);
              },
              child: Row(
                children: [
                const Icon(Icons.settings,color:Color(0xff303030),size: 32,),
               const SizedBox(width: 8,),
                Text("Settings",style:theme.textTheme.titleLarge!.copyWith(color:const Color(0xff303030) ), )
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
 enum MenuItem{
  categories,
   settings
 }