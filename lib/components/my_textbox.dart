import 'package:flutter/material.dart';

// Custom text box widget with edit button
class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function() onPressed;

  const MyTextBox({
    super.key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20.0)
        ),
      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // section name
              Text(
                sectionName, 
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              // edit button
              IconButton(
                onPressed: onPressed, 
                icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.inversePrimary),),
            ],
          ),
          // text
          Text(text),
        ],
      ),
    );
  }
}