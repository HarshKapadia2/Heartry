import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/text_providers.dart';
import '../../../widgets/color_picker_dialog.dart';

class ImageTextHandler extends ConsumerWidget {
  const ImageTextHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final value = watch(textSizeProvider).state;
    final color = watch(textColorProvider).state;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Customize Text",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 15),
          const Text(
            "Color",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              _showColorPicker(context, color);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black45,
                ),
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Size",
            style: TextStyle(fontSize: 18),
          ),
          Slider(
            value: value,
            max: 2,
            divisions: 20,
            label: value.toStringAsPrecision(3),
            onChanged: (value) {
              context.read(textSizeProvider).state = value;
            },
          ),
        ],
      ),
    );
  }

  void _showColorPicker(BuildContext context, Color currentColor) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ColorPickerDialog(
          currentColor: currentColor,
          selectedColor: (color) {
            context.read(textColorProvider).state = color;
          },
        );
      },
    );
  }
}
