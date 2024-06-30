import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class Pickerprice extends StatefulWidget {
  const Pickerprice({super.key, required Null Function(dynamic selectedPrice) onPriceSelected});

  @override
  State<Pickerprice> createState() => _PickerpriceState();
}

class _PickerpriceState extends State<Pickerprice> {
  int _thirdprise=500;

  void _thirdprises() {
    setState(() {
      _thirdprise++;
    });
  }

  void _thirdprisees() {
    setState(() {
      _thirdprise--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 288,
      height: 206,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff009589)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(

          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Price",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff009589)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      _thirdprises();
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: Color(0xff009589),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: const Text(
                          "K", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color:Color(0xff009589) )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: NumberPicker(
                        value:   _thirdprise,
                        minValue: 0,
                        maxValue: 1000,
                        step: 1,
                        itemHeight: 40,
                        itemWidth: 80,
                        axis: Axis.vertical,
                        onChanged: (value) => setState(() =>   _thirdprise = value),
                        textStyle:  TextStyle(
                            color: const Color.fromARGB(50, 0, 137, 149),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        selectedTextStyle:  TextStyle(
                            fontSize: 20, color: const Color(0xff009589), fontWeight: FontWeight.w400),
                      ),
                    ),
                    // Text("Current value:${_currentHorizontalIntValue}"),
                  ],
                ),
                const SizedBox(width:60,),
                InkWell(
                  onTap: () {
                    _thirdprisees();
                  },
                  child:  const Icon(
                    Icons.remove,
                    size: 25,
                    color: Color(0xff009589),
                  ),
                ),

              ],
            )
          ]),
    );
  }
}