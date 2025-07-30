import 'package:flutter/material.dart';
import 'package:news_app/Categories/source_tab_item.dart';
import 'package:news_app/News/news_list.dart';

import '../DataLayer/Model/SourcesResponse/Source.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sources;
  SourcesTabs(this.sources);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (newIndex){
              selectedIndex = newIndex;
              setState(() {});
            },
            indicatorColor:theme.primaryColor,
              indicatorWeight: 4,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => SourceTabItem( source, widget.sources.indexOf(source) == selectedIndex
                      ))
                  .toList()),
          Expanded(child: NewsList(widget.sources[selectedIndex]))
        ],
      ),
    );
  }
}
