import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double verticalPadding;
  final String value;
  final Icon suffixIcon;
  final bool showLabel;

  const CustomTextField(
      {@required this.hintText,
      this.verticalPadding,
      this.value,
      this.suffixIcon,
      this.showLabel = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          showLabel
              ? Text(hintText.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      // color: Color(0xFF9CA4AA)),
                      color: theme.accentColor))
              : SizedBox(),
          SizedBox(height: 7.0),
          TextFormField(
            initialValue: value,
            textAlign: TextAlign.center,

            // style: TextStyle(fontWeight: FontWeight.bold),

            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                contentPadding: EdgeInsets.symmetric(
                    vertical: verticalPadding != null ? verticalPadding : 10.0,
                    horizontal: 15.0),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400])),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    // color: Colors.grey[400],
                    color: theme.accentColor)),
          )
        ],
      ),
    );
  }
}
