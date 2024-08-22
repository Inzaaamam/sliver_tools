// ignore_for_file: override_on_non_overriding_member

import 'dart:math';
import 'package:flutter/material.dart';

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Color backgroundColor;
  final double headerHeight;

  MyHeaderDelegate({
    required this.title,
    required this.backgroundColor,
    required this.headerHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double currentExtent = max(minExtent, maxExtent - shrinkOffset);

    return Container(
      color: backgroundColor,
      height: currentExtent,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
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
