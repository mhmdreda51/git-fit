import 'package:flutter/material.dart';

import '../../constants/screenutil.dart';
import '../../constants/text_styles.dart';

class RegisterTextField extends StatefulWidget {
  RegisterTextField({required this.suffixVisible,required this.controller,required this.labelText,required this.isSecure,required this.prefixIcon});
  TextEditingController controller;
  bool suffixVisible=false;
  String labelText;
  bool isSecure=false;
  IconData prefixIcon;

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: height(20)),
        child: TextField(
          autofocus: false,
          obscureText: widget.isSecure,
          controller: widget.controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(15.0))),
            labelText: widget.labelText,
            labelStyle: labelTextField,
            prefixIcon: Icon(widget.prefixIcon,color: Colors.black,),
              // suffixVisible
            suffixIcon: widget.suffixVisible ==false? null :IconButton(onPressed: (){
              setState(() {
                if(widget.isSecure==true){
                  widget.isSecure=false;
                }else if(widget.isSecure==false){
                  widget.isSecure=true;
                }
                // widget.isSecure!=widget.isSecure;
              });
            }, icon: Icon(widget.isSecure==true? Icons.visibility_off:Icons.visibility))
          ),
        ),
      ),
    );
  }
}
