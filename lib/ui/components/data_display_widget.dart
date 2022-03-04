import 'package:flutter/material.dart';

class DataDisplayWidget extends StatelessWidget {
  final String heading;
  final IconData iconData;
  final List<Widget> listData;

  const DataDisplayWidget(
      {Key? key,
      required this.heading,
      required this.iconData,
      required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 3,
                  ),
                  child: Text(
                    heading,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 2,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                iconData,
                color: Colors.grey.shade800,
                size: 20,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade800,
          ),
          padding: const EdgeInsets.all(16),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: listData,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
