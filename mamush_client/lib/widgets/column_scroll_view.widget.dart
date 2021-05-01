import 'package:flutter/material.dart';

class ColumnScrollView extends StatelessWidget {
  final Widget child;

  const ColumnScrollView({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
