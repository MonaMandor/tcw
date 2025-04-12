
import 'package:flutter/material.dart';
import 'package:tcw/core/constansts/context_extensions.dart';

class appBar extends StatelessWidget {
  final String title;
  const appBar({
   required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: context.propWidth(70)),
        Text(
          title,
          style: context.textTheme.headlineMedium,
        ),
        //back
      ],
    );
  }
}
