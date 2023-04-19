// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnahSearchBar extends StatelessWidget {
  const AnahSearchBar({
    Key? key,
    required this.onChange,
    this.textEditingController,
  }) : super(key: key);
  final Function(String value) onChange;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: TextField(
          controller: textEditingController,
          autocorrect: true,
          decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
