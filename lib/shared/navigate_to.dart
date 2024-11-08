import 'package:flutter/material.dart';

navigateTo({required BuildContext context, required Widget target}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => target));
