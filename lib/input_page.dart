import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:images_picker/images_picker.dart';
import 'buttons_page.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  String message = '';
  double textSize = 16;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  double cornerRadius = 8;
  double width = 200;
  double arrowWidth = 15;
  double arrowHeight = 10;
  String selectedButton = 'Button 1';
  String selectedTarget = 'Button 1';
  Image? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('20BCE0169 - Tooltip'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildDropDownFormField(
              'Target Element',
              selectedTarget,
              ['Button 1', 'Button 2', 'Button 3'],
              (value) => setState(() => selectedTarget = value!),
            ),
            _buildFormField(
              'Tooltip text',
              onChanged: (value) => message = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter tooltip text';
                }
                return null;
              },
            ),
            _buildImagePicker(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    'Text Size',
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        textSize = double.tryParse(value) ?? 16,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildFormField(
                    'Padding',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => {},
                  ),
                ),
              ],
            ),
            _buildColorPickerFormField(
              'Text Color',
              selectedColor: textColor,
              onColorChanged: (color) => setState(() => textColor = color),
            ),
            _buildColorPickerFormField(
              'Background Color',
              selectedColor: backgroundColor,
              onColorChanged: (color) =>
                  setState(() => backgroundColor = color),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    'Corner Radius',
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        cornerRadius = double.tryParse(value) ?? 8,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildFormField(
                    'Width',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => width = double.tryParse(value) ?? 200,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    'Arrow Width',
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        arrowWidth = double.tryParse(value) ?? 15,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildFormField(
                    'Arrow Height',
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        arrowHeight = double.tryParse(value) ?? 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ButtonsPage(
                        message: message,
                        textSize: textSize,
                        textColor: textColor,
                        backgroundColor: backgroundColor,
                        cornerRadius: cornerRadius,
                        width: width,
                        arrowWidth: arrowWidth,
                        arrowHeight: arrowHeight,
                        selectedButton: selectedButton,
                        selectedTarget: selectedTarget,
                        pImage: pickedImage,
                      ),
                    ),
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text('Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text('Pick an Image', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        pickedImage != null ? pickedImage! : const Text('No image selected'),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () async {
            List<Media>? res = await ImagesPicker.pick(
              count: 1,
              pickType: PickType.image,
              language: Language.System,
            );
            if (res != null && res.isNotEmpty) {
              setState(() {
                pickedImage = Image.file(File(res[0].path), height: 100);
              });
            }
          },
          child: const Text(
            'Pick Image',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildFormField(
    String labelText, {
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
    );
  }

  Widget _buildColorPickerFormField(
    String labelText, {
    required Color selectedColor,
    required ValueChanged<Color> onColorChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(labelText, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () =>
                  _showColorPicker(context, selectedColor, onColorChanged),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropDownFormField(
    String labelText,
    String selectedValue,
    List<String> items,
    void Function(String?)? onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _showColorPicker(
    BuildContext context,
    Color initialColor,
    ValueChanged<Color> onColorChanged,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: initialColor,
              onColorChanged: onColorChanged,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
