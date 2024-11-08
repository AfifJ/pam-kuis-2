import 'package:flutter/material.dart';

Widget customButton(
    {required BuildContext context,
    required VoidCallback? onPressed,
    Widget? child}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 24),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: child,
    ),
  );
}
