// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CollapsibleWidget extends StatefulWidget {
  const CollapsibleWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final dynamic data;
  @override
  _CollapsibleWidgetState createState() => _CollapsibleWidgetState();
}

class _CollapsibleWidgetState extends State<CollapsibleWidget> {
  bool _isExpanded = false;

  void _toggleCollapse() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.data),
          onTap: _toggleCollapse,
        ),
        if (_isExpanded)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Collapsible content goes here.'),
          ),
      ],
    );
  }
}
