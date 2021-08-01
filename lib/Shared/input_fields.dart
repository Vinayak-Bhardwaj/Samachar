import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  
  IconData icon;
  String hintText;
  void Function(String)? changed;
  String? Function(String?)? valid;

  InputField({required this.hintText, required this.icon, required this.changed, this.valid});

  
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFFF1E6FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        validator: widget.valid,
        onChanged: widget.changed,
        cursorColor: Color(0xFF6F35A5),
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: Color(0xFF6F35A5),
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
