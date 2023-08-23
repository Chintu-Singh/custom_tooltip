import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerFormField extends StatefulWidget {
  final String labelText;
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;

  const ColorPickerFormField({
    required this.labelText,
    required this.selectedColor,
    required this.onColorChanged,
  });

  @override
  _ColorPickerFormFieldState createState() => _ColorPickerFormFieldState();
}

class _ColorPickerFormFieldState extends State<ColorPickerFormField> {
  Color pickerColor = Colors.black;

  @override
  void initState() {
    super.initState();
    pickerColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(widget.labelText),
        SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: pickerColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () => _showColorPicker(context),
            ),
          ],
        ),
      ],
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (color) {
                setState(() {
                  pickerColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
                widget.onColorChanged(pickerColor);
              },
            ),
          ],
        );
      },
    );
  }
}
