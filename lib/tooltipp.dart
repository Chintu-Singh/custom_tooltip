import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final double textSize;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final double width;
  final double arrowWidth;
  final double arrowHeight;
  final Image? image;

  CustomTooltip({
    required this.message,
    required this.child,
    this.textSize = 16,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.black,
    this.cornerRadius = 8,
    this.width = 200,
    this.arrowWidth = 15,
    this.arrowHeight = 10,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showCustomTooltip(context);
      },
      onLongPressEnd: ((details) => {_removeOverlayEntry()}),
      child: child,
    );
  }

  late OverlayEntry overlayEntry;
  void _showCustomTooltip(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    final tooltipWidget = Column(
      children: [
        SizedBox(
          width: arrowWidth,
          height: arrowHeight,
          child: CustomPaint(
            painter: _ArrowPainter(arrowWidth, arrowHeight),
          ),
        ),
        Material(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (image != null)
                  Container(
                    child: image,
                    width: 200,
                    height: 200,
                  ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    final tooltipOverlay = Positioned(
      left: offset.dx - (width - renderBox.size.width) / 2,
      top: offset.dy + renderBox.size.height,
      child: tooltipWidget,
    );

    overlayEntry = OverlayEntry(builder: (context) => tooltipOverlay);

    Overlay.of(context)!.insert(overlayEntry);
  }

  void _removeOverlayEntry() {
    overlayEntry.remove();
  }
}

class _ArrowPainter extends CustomPainter {
  final double arrowWidth;
  final double arrowHeight;

  _ArrowPainter(this.arrowWidth, this.arrowHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width / 2 - arrowWidth / 2, arrowHeight)
      ..lineTo(size.width / 2 + arrowWidth / 2, arrowHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
