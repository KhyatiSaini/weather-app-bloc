import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String data;
  final bool givePadding;
  const CustomListTile({Key? key, required this.title, required this.data, this.givePadding = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: givePadding ? 10 : 0),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16,
            ),
          ),
          Text(
            data,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}