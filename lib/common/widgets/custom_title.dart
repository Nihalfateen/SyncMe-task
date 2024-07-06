import 'package:flutter/material.dart';

Widget CustomTitle({required String Title}) {
  return Text(
    '$Title',
    style: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 36,
      color: const Color(0xFF2E2E2E),
      fontWeight: FontWeight.w700,
    ),
  );
}
