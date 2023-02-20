import 'package:flutter/material.dart';

class AddElementButton extends StatelessWidget {
  final String buttonText;
  final Function handleFunction;

  const AddElementButton(this.buttonText, this.handleFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RawMaterialButton(
          onPressed: () => handleFunction(),
          fillColor: Theme.of(context).primaryColor,
          child: Row(
            children: [
              Text(buttonText, style: TextStyle(color: Colors.white)),
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
