//* search heading text
import 'package:flutter/material.dart';

class SearchTitleText extends StatelessWidget {
  const SearchTitleText({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
