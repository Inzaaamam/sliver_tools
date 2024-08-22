import 'package:flutter/material.dart';
import 'package:sliver/sliver/headerprisistent.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _openedListIndex;

  void _toggleList(int index) {
    setState(() {
      if (_openedListIndex == index) {
        _openedListIndex = null; // Close the currently opened list
      } else {
        _openedListIndex =
            index; // Open the new list and close the previous one
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate(
              title: 'Sticky header',
              backgroundColor: Colors.yellow,
              headerHeight: 120,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate(
              title: 'header 1',
              backgroundColor: Colors.brown,
              headerHeight: 120,
            ),
          ),
          _buildMultiSliver(
            index: 0,
            title: "Pinned Header 2",
            color: Colors.yellow,
          ),
          _buildMultiSliver(
            index: 1,
            title: "Pinned Header 3",
            color: Colors.red,
          ),
          _buildMultiSliver(
            index: 2,
            title: "Pinned Header 4",
            color: Colors.blue,
          ),
          _buildMultiSliver(
            index: 3,
            title: "Pinned Header 5",
            color: Colors.grey,
          ),
          _buildMultiSliver(
            index: 4,
            title: "Pinned Header 6",
            color: Colors.orange,
          ),
          _buildMultiSliver(
            index: 5,
            title: "Pinned Header 7",
            color: Colors.grey,
          ),
          _buildMultiSliver(
            index: 6,
            title: "Pinned Header 8",
            color: Colors.deepPurple,
          ),
          _buildMultiSliver(
            index: 7,
            title: "Pinned Header 9",
            color: const Color.fromARGB(255, 55, 134, 208),
          ),
          _buildMultiSliver(
            index: 8,
            title: "Pinned Header 10",
            color: const Color.fromARGB(255, 226, 229, 232),
          ),
          _buildMultiSliver(
            index: 9,
            title: "Pinned Header 11",
            color: const Color.fromARGB(255, 202, 225, 90),
          ),
          _buildMultiSliver(
            index: 10,
            title: "Pinned Header 12",
            color: const Color.fromARGB(255, 55, 134, 208),
          ),
        ],
      ),
    );
  }

  Widget _buildMultiSliver({
    required int index,
    required String title,
    required Color color,
  }) {
    bool isListVisible = _openedListIndex == index;

    return MultiSliver(
      pushPinnedChildren: isListVisible ? false : true,
      children: <Widget>[
        SliverPersistentHeader(
          pinned: isListVisible,
          delegate: HeaderDelegate(
            title: title,
            backgroundColor: color,
            headerHeight: 120,
            isExpanded: isListVisible,
            onToggle: () => _toggleList(index),
          ),
        ),
        SliverToBoxAdapter(
          child: isListVisible
              ? Column(
                  children: List.generate(10, (i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: i % 2 == 0 ? Colors.green : Colors.greenAccent,
                        height: 120,
                        alignment: Alignment.center,
                        child: Text(
                          "Item $i",
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  }),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Color backgroundColor;
  final double headerHeight;
  final bool isExpanded;
  final VoidCallback onToggle;

  HeaderDelegate({
    required this.title,
    required this.backgroundColor,
    required this.headerHeight,
    required this.onToggle,
    this.isExpanded = false,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      height: headerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          IconButton(
            icon: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            onPressed: onToggle,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => headerHeight;

  @override
  double get minExtent => headerHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
