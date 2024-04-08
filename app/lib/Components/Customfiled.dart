// Name and address

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_filed extends StatefulWidget {
  Custom_filed({this.labelText});
  String? labelText;

  @override
  State<Custom_filed> createState() => _Custom_filedState();
}

class _Custom_filedState extends State<Custom_filed> {
  final _titleController = TextEditingController();
  void dispose(){
    super.dispose();
    _titleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: Container(
            width: 346,
            height: 59,
            margin: EdgeInsets.only(top: 20.h),
            child: TextFormField(
              controller:_titleController ,
              decoration:
              InputDecoration(
                labelText: widget.labelText,

                labelStyle: const TextStyle(color:Color(0xff009589)),
                enabledBorder: const OutlineInputBorder( borderRadius:
                BorderRadius.all(Radius.circular(16)),borderSide: BorderSide(color:Color(0xff009589))),
                focusedBorder: const OutlineInputBorder( borderRadius:
                BorderRadius.all(Radius.circular(16)),borderSide: BorderSide(color:Color(0xff009589))),
              ),),
          ),

        ),
      ],
    );
  }
}

class Custom_filed2 extends StatefulWidget {
  Custom_filed2({this.labelText});
  String? labelText;

  @override
  State<Custom_filed2> createState() => _Custom_filed2State();
}

class _Custom_filed2State extends State<Custom_filed2> {
  final _titlleController = TextEditingController();
  void dispose(){
    super.dispose();
    _titlleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: Container(
            width: 346,
            height: 59,
            child: TextFormField(
              controller:_titlleController ,
              decoration:
              InputDecoration(
                labelText: widget.labelText,
                labelStyle: const TextStyle(color:Color(0xff009589)),
                enabledBorder: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color:Color(0xff009589))),
                focusedBorder: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color:Color(0xff009589))),
              ),),
          ),

        ),
      ],
    );
  }
}

