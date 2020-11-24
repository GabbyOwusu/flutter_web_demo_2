import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'images/logo.png',
          width: 130,
        ),
        SizedBox(width: 100),
        Text(
          'CATALOG',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        SizedBox(width: 30),
        Text(
          'COLLECTIONS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 300),
        Icon(
          Icons.search,
          color: Colors.black,
          size: 15,
        ),
        SizedBox(width: 10),
        Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
