import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';

abstract class Styles {
  static const textStyle10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w900,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.none,
    // color: Colors.white,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const textStyle40 = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      decoration: TextDecoration.none);
  static const textStyle64 = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.normal,
    fontFamily: kIrishGrover,
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.none,
  );
}
