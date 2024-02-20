
import 'package:flutter/material.dart';

Widget starsYellow(i) => Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    for(int x = 0; x < i; x++ )
    const Icon(
      Icons.star,
      color: Colors.yellow,
      size: 20,
    ),
    for(int y = 0; y < 5 - i; y++ )
    const Icon(
      Icons.star,
      color: Colors.grey,
      size: 20,
    )
  ],
);