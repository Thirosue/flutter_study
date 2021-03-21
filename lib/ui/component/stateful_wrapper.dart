import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Widget child;
  final Function? onInit;

  const StatefulWrapper({
    required this.child,
    Key? key,
    this.onInit,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit!();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
