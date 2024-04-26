import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class BadgeTextView extends StatefulWidget {
  BadgeTextView(
      {super.key,
      required this.num,
      required this.size,
      this.color = Colors.white,
      this.fontWeight,
      this.textStyle,
      this.overflow,
      this.textAlign,
      this.maxLine});

  final int num;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLine;

  @override
  State<BadgeTextView> createState() => StateChild();
}

class BadgeTextViewState extends State<BadgeTextView> with StateMother {
  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyMedium!;
    (widget.textStyle == null) ? null : style = widget.textStyle!.copyWith();
    (widget.color == null)
        ? null
        : style = style.copyWith(
            color: (widget.num <= 0) ? Colors.transparent : widget.color);
    style = style.copyWith(fontSize: widget.size);
    (widget.fontWeight == null)
        ? null
        : style = style.copyWith(fontWeight: widget.fontWeight);
    style = style.copyWith(overflow: widget.overflow ?? TextOverflow.ellipsis);

    if (widget.num > 999) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
        constraints: BoxConstraints(
          minWidth: 12,
          minHeight: 12,
        ),
        child: Text(
          "999+",
          style: style,
          textAlign: TextAlign.center,
        ),
      ).width(40);
    } else if (widget.num > 99) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
        constraints: BoxConstraints(
          minWidth: 12,
          minHeight: 12,
        ),
        child: Text(
          widget.num.toString(),
          style: style,
          textAlign: TextAlign.center,
        ),
      ).width(30);
    } else if (widget.num > 9) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: BoxConstraints(
          minWidth: 12,
          minHeight: 12,
        ),
        child: Text(
          widget.num.toString(),
          style: style,
          textAlign: TextAlign.center,
        ),
      ).width(30);
    } else {
      return Container(
        height: widget.size + 8,
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (widget.num <= 0) ? Colors.transparent : Colors.red),
        alignment: Alignment.center,
        child: Text(
          widget.num.toString(),
          style: style,
        ).fontSize(widget.size),
      ).width(30);
    }
  }
}

main() async {
  return buildApp(
      appHome: BadgeTextView(
    num: 7,
    size: 10,
  ).center());
}
