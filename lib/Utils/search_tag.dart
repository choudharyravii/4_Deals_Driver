import 'package:flutter/material.dart';
import 'package:four_deals_app/Models/data.dart';

class SearchTag extends StatelessWidget {
  const SearchTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Data.height * 4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Data.height * 5)),
      child: const Text(
        "audi for rent",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
