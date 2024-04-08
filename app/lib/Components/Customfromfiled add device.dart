import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textfrom_filedDevicename extends StatefulWidget {
  Textfrom_filedDevicename({this.labelText});
  String? labelText;

  @override
  State<Textfrom_filedDevicename> createState() => _Textfrom_filedDevicenameState();
}

class _Textfrom_filedDevicenameState extends State<Textfrom_filedDevicename> {
  final _textController = TextEditingController();
  void dispose(){
    super.dispose();
    _textController.dispose();
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
              controller:_textController ,
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

class Textfrom_filedDeviceBrand extends StatefulWidget {
  Textfrom_filedDeviceBrand({this.labelText});
  String? labelText;

  @override
  State<Textfrom_filedDeviceBrand> createState() => _Textfrom_filedDeviceBrandState();
}

class _Textfrom_filedDeviceBrandState extends State<Textfrom_filedDeviceBrand> {
  final _BrandController = TextEditingController();
  void dispose(){
    super.dispose();
    _BrandController.dispose();
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
              controller:_BrandController ,

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

