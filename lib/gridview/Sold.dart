import 'package:flutter/material.dart';
import 'package:flutter_prac2/week6task/Items.dart';
import 'package:flutter_prac2/week6task/gridview/Stars.dart';

Widget ratingSold(Items  item) => Row(
  children: [
    starsYellow(item.rate),
    const SizedBox(
      width: 5,
    ),
    Text(
      '${item.sold} sold',
    ),
  ],
);