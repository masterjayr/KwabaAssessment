import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InputField extends StatefulWidget {
  final String? labelText;
  final String? errorMessage;
  final bool? obscureText, isMultiline;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? value;
  final Function()? onTap;
  final bool? isReadOnly;
  final Color? borderColor, fillColor, hintColor;
  final String? prefixText, hintText;
  final double? height;
  final int? maxLength;
  final int? minLines;
  final Widget? prefixIcon;
  const InputField(
      {Key? key,
      this.fillColor = Colors.white,
      this.height,
      this.labelText,
      this.prefixIcon,
      this.minLines,
      this.maxLength,
      this.hintText,
      this.hintColor,
      this.borderColor,
      this.isMultiline,
      this.prefixText,
      this.errorMessage,
      this.isReadOnly = false,
      this.obscureText = false,
      @required this.controller,
      this.keyboardType,
      this.value,
      this.onTap})
      : super(key: key);
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool iconToogle = false;
  @override
  Widget build(BuildContext context) {
    double sizeH = MediaQuery.of(context).size.height;
    return Container(
      height: widget.height ?? sizeH * 0.07,
      decoration: BoxDecoration(),
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.isReadOnly!,
        minLines: widget.minLines,
        obscureText: widget.obscureText! ? !iconToogle : iconToogle,
        // initialValue: widget.value,
        onTap: widget.onTap ?? () {},
        maxLength: widget.maxLength,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.errorMessage;
          } else if (widget.labelText == 'Password' && value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          prefixText: widget.prefixText,
          prefixStyle: TextStyle(color: Colors.black, fontSize: 18),
          filled: widget.fillColor == null ? false : true,
          fillColor: widget.fillColor,
          prefixIcon: widget.prefixIcon,
          labelStyle: TextStyle(color: Color(0xff8C8C8C), fontSize: 14),
          suffixIcon: widget.obscureText!
              ? IconButton(
                  icon: !iconToogle
                      ? Icon(MaterialCommunityIcons.eye_off,
                          color: Colors.black)
                      : Icon(MaterialCommunityIcons.eye, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      iconToogle = !iconToogle;
                    });
                  },
                )
              : Offstage(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor != null
                    ? widget.borderColor!
                    : Color(0xffC4C4C4),
                width: 1.0),
          ),
          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.red, width: 1.0),
          // ),
        ),
      ),
    );
  }
}
