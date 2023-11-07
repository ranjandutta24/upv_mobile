import 'package:flutter/material.dart';

class CollapsibleWidget extends StatefulWidget {
  const CollapsibleWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;
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
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Collapsible content goes here.'),
          ),
      ],
    );
  }
}
