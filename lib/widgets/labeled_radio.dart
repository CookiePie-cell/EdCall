import 'package:ed_call/data_diri_screen.dart';
import 'package:ed_call/helper/helper.dart';
import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final Gender groupValue;
  final Gender value;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<Gender>(
              groupValue: groupValue,
              value: value,
              onChanged: (Gender? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label,
                style:
                    TextStyle(fontSize: Helper.getAdaptiveText(context, 12.0))),
          ],
        ),
      ),
    );
  }
}
