import 'package:flutter/material.dart';

import '../DataLayer/Model/SourcesResponse/Source.dart';




class SourceTabItem extends StatelessWidget {
   SourceTabItem(this.source,this.isSelected);
  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
            color: isSelected? theme.primaryColor: Colors.white,
        border: Border.all(color: theme.primaryColor,width: 2)
      ),
      child: Text(source.name??'',style: TextStyle(color: isSelected? Colors.white : theme.primaryColor,fontSize: 18),),
    );
  }
}
