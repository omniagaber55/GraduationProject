import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class PickerAmount extends StatefulWidget {
  final Function(int) onAmountSelected;

  const PickerAmount({Key? key, required this.onAmountSelected}) : super(key: key);

  @override
  State<PickerAmount> createState() => _PickerAmountState();
}


class _PickerAmountState extends State<PickerAmount> {


  int _currentHorizontalIntValue = 500;
  int _pickersecIntvalue = 500;


  void _currentHorizontalIntValuees() {
    setState(() {
      _pickersecIntvalue++;
    });
  }

  void _currentHorizontalIntValues() {
    setState(() {
      _pickersecIntvalue--;
    });
  }

  void _currentHorizontalIntValuee() {
    setState(() {
      _currentHorizontalIntValue--;
    });
  }

  void _currentHorizontalIntValueee() {
    setState(() {
      _currentHorizontalIntValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304,
      height: 206,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff009589)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: [
        const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Amount",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff009589)),
              ),
            )),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _currentHorizontalIntValueee();
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: Color(0xff009589),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _currentHorizontalIntValuee();
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 25,
                      color: Color(0xff009589),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10,),
            Column(
              verticalDirection: VerticalDirection.down,
              children: [
                const Center(
                    child: Text(
                        "G", style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff009589))
                    )),
                numberpicker(),
                // Text("Current value:${_currentHorizontalIntValue}"),
              ],
            ),
            const Text(
              ":",
              style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff009589)),
            ),
            const SizedBox(width: 10,),
            Column(
              verticalDirection: VerticalDirection.down,
              children: [
                const Center(
                    child: Text(
                        "K", style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff009589))
                    )),
                NumberPicker(
                  value: _pickersecIntvalue,
                  minValue: 0,
                  maxValue: 1000,
                  step: 1,
                  itemHeight: 40,
                  itemWidth: 80,
                  axis: Axis.vertical,
                  onChanged: (value) =>
                      setState(() => _pickersecIntvalue = value),
                  textStyle: const TextStyle(
                      color: Color.fromARGB(50, 0, 137, 149),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  selectedTextStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff009589),
                      fontWeight: FontWeight.w400),
                ),
                // Text("Current value:${_currentHorizontalIntValue}"),
              ],
            ),
            const SizedBox(width: 10,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _currentHorizontalIntValuees();
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: Color(0xff009589),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _currentHorizontalIntValues();
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 25,
                      color: Color(0xff009589),
                    ),
                  ),
                ),
              ],
            ),

          ],
        )
      ]),
    )
    ;
  }

  NumberPicker numberpicker() {
    return NumberPicker(
  value: _currentHorizontalIntValue,
  minValue: 0,
  maxValue: 1000,
  step: 1,
  itemHeight: 40,
  itemWidth: 80,
  axis: Axis.vertical,
  onChanged: (value) {
    setState(() {
      _currentHorizontalIntValue = value;
      widget.onAmountSelected(value); // Call the callback
    });
  },
  textStyle: const TextStyle(
    color: Color.fromARGB(50, 0, 137, 149),
    fontSize: 16,
    fontWeight: FontWeight.w400),
  selectedTextStyle: const TextStyle(
    fontSize: 20,
    color: Color(0xff009589),
    fontWeight: FontWeight.w400),
);

  }
}