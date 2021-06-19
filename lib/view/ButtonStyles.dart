import 'package:flutter/material.dart';

ButtonStyle? outlineButtonStyle(BuildContext context) {
  OutlinedButton.styleFrom(
    textStyle: TextStyle(fontSize: 3),
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          );
        return null; // Defer to the widget's default.
      },
    ),
  );
}
