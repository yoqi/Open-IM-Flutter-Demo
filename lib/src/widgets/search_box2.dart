import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openim_demo/src/res/images.dart';
import 'package:openim_demo/src/res/strings.dart';
import 'package:openim_demo/src/res/styles.dart';

class SearchBox2 extends StatefulWidget {
  const SearchBox2({
    Key? key,
    this.controller,
    this.focusNode,
    this.textStyle,
    this.hintStyle,
    this.hintText,
    this.searchIconColor,
    this.searchIconHeight,
    this.searchIconWidth,
    this.margin,
    this.padding,
    this.enabled = true,
    this.autofocus = false,
    this.clearBtn,
    this.height,
    this.onSubmitted,
  }) : super(key: key);
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final String? hintText;
  final Color? searchIconColor;
  final double? searchIconWidth;
  final double? searchIconHeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final bool autofocus;
  final double? height;
  final Widget? clearBtn;
  final Function(String)? onSubmitted;

  @override
  _SearchBox2State createState() => _SearchBox2State();
}

class _SearchBox2State extends State<SearchBox2> {
  bool _showClearBtn = false;

  @override
  void initState() {
    widget.controller?.addListener(() {
      setState(() {
        _showClearBtn = widget.controller!.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 32.h,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFFB300), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              style: widget.textStyle ?? PageStyle.ts_000000_16sp,
              autofocus: widget.autofocus,
              enabled: widget.enabled,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: widget.hintText ?? StrRes.search,
                hintStyle: widget.hintStyle ?? PageStyle.ts_666666_16sp,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
              onSubmitted: widget.onSubmitted,
            ),
          ),
          if (_showClearBtn && widget.clearBtn != null)
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                widget.controller?.clear();
              },
              child: widget.clearBtn,
            ),
        ],
      ),
    );
  }
}
