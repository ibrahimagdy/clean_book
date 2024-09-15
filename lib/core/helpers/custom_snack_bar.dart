import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(text , style: TextStyles.font16Regular.copyWith(color: Colors.white),),
    ),
  );
}