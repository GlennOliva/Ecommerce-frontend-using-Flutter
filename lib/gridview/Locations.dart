import 'package:flutter/material.dart';
import 'package:flutter_prac2/week6task/Items.dart';

Widget location(Items item) => Row(
  children: [
    const Icon(
      Icons.add_location,
      size: 18,
    ),
    Expanded(
      child: Text(
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        item.location
      ),
    )
  ],
);