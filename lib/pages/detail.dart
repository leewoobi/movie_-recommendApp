import 'package:flutter/material.dart';

class DetailContView extends StatefulWidget {
  const DetailContView({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  _DetailContViewState createState() => _DetailContViewState();
}

class _DetailContViewState extends State<DetailContView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.data['title']),
      ),
    );
  }
}
