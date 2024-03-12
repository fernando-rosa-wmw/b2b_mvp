
import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  const NumericStepButton(
      {super.key,
        this.minValue = 0,
        this.maxValue = 10,
        required this.onChanged});

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.blue,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                if (counter > widget.minValue) {
                  counter--;
                }
                widget.onChanged(counter);
              });
            },
          ),
          Text(
            '$counter',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                if (counter < widget.maxValue) {
                  counter++;
                }
                widget.onChanged(counter);
              });
            },
          ),
        ],
      ),
    );
  }
}