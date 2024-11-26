import 'package:flutter/material.dart';
Color blue300 = Colors.blue[300] as Color;
Color blue500 = Colors.blue[500] as Color;

enum Position { left, right }

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    this.text,
    this.icon,
    this.textColor,
    this.buttonColor,
    this.isDisable = false, // Default to not disabled
    this.width,
    this.widthPercentage,
    this.onPressed,
    this.textStyle,
    this.position = Position.left, // Default position to left
  });

  final String? text;
  final Icon? icon;
  final Color? textColor;
  final Color? buttonColor;
  final bool? isDisable;
  final double? width;
  final double? widthPercentage;
  final dynamic Function()? onPressed;
  final TextStyle? textStyle;
  final Position? position;

  @override
  Widget build(BuildContext context) {
    // Handle null values for width and widthPercentage gracefully
    double calculatedWidth = width ??
        (widthPercentage != null
            ? MediaQuery.of(context).size.width * widthPercentage!
            : MediaQuery.of(context).size.width * 1);

    return Container(
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: calculatedWidth,
      child: TextButton(
        onPressed: isDisable == true
            ? null
            : onPressed, // Disable button if isDisable is true
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && position == Position.left) ...[
              Icon(
                icon!.icon,
                color: textColor ?? Colors.black,
              ),
              const SizedBox(width: 8),
            ],
            if (text != null) ...[
              Text(
                text ?? '',
                style: textStyle ??
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: textColor ?? Colors.black,
                        ),
              ),
            ],
            if (icon != null && position == Position.right) ...[
              const SizedBox(width: 8),
              Icon(
                icon!.icon,
                color: textColor ?? Colors.black,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
