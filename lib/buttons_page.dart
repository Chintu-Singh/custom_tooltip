import 'package:flutter/material.dart';
import 'package:plotcustomtooltip/tooltipp.dart';

class ButtonsPage extends StatelessWidget {
  final String message;
  final double textSize;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final double width;
  final double arrowWidth;
  final double arrowHeight;
  final String selectedButton;
  final String selectedTarget;
  Image? pImage;
  ButtonsPage({
    required this.message,
    required this.textSize,
    required this.textColor,
    required this.backgroundColor,
    required this.cornerRadius,
    required this.width,
    required this.arrowWidth,
    required this.arrowHeight,
    required this.selectedButton,
    required this.selectedTarget,
    required this.pImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('20BCE0169 - Tooltip'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                selectedTarget != "Button 1"
                    ? CustomTooltip(
                        message: "Default tooltip 1",
                        textSize: 16,
                        textColor: Colors.white,
                        backgroundColor: Colors.black,
                        cornerRadius: 8.0,
                        width: 200,
                        arrowWidth: 15,
                        arrowHeight: 10,
                        image: null,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(16),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Button 1',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    : CustomTooltip(
                        message: message,
                        textSize: textSize,
                        textColor: textColor,
                        backgroundColor: backgroundColor,
                        cornerRadius: cornerRadius,
                        width: width,
                        arrowWidth: arrowWidth,
                        arrowHeight: arrowHeight,
                        image: pImage ?? null,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(16),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Button 1',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 50,
                ),
                selectedTarget != "Button 2"
                    ? CustomTooltip(
                        message: "Default tooltip 2",
                        textSize: 16,
                        textColor: Colors.white,
                        backgroundColor: Colors.black,
                        cornerRadius: 8.0,
                        width: 200,
                        arrowWidth: 15,
                        arrowHeight: 10,
                        image: null,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(16),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Button 2',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    : CustomTooltip(
                        message: message,
                        textSize: textSize,
                        textColor: textColor,
                        backgroundColor: backgroundColor,
                        cornerRadius: cornerRadius,
                        width: width,
                        arrowWidth: arrowWidth,
                        arrowHeight: arrowHeight,
                        image: pImage ?? null,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(16),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Button 2',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 50,
                ),
                selectedTarget != "Button 3"
                    ? CustomTooltip(
                        message: "Default tooltip 3",
                        textSize: 16,
                        textColor: Colors.white,
                        backgroundColor: Colors.black,
                        cornerRadius: 8.0,
                        width: 200,
                        arrowWidth: 15,
                        arrowHeight: 10,
                        image: null,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(16),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Button 3',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    : CustomTooltip(
                        message: message,
                        textSize: textSize,
                        textColor: textColor,
                        backgroundColor: backgroundColor,
                        cornerRadius: cornerRadius,
                        image: pImage ?? null,
                        width: width,
                        arrowWidth: arrowWidth,
                        arrowHeight: arrowHeight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(16),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Button 3',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
