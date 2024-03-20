import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int? counter;

  final Function onAddChanged;
  final Function onRemoveChanged;

  const NumericStepButton({
    super.key,
    this.minValue = 0,
    this.maxValue = 10,
    this.counter,
    required this.onAddChanged,
    required this.onRemoveChanged,
  });

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  @override
  Widget build(BuildContext context) {
    int counter = widget.counter ?? 0;
    return Card.outlined(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Theme.of(context).colorScheme.primary,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              widget.onRemoveChanged();
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
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.primary,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              widget.onAddChanged();
            },
          ),
        ],
      ),
    );
  }
}
