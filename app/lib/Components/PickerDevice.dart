import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PickerDevice extends StatefulWidget {
  final Function(int) onDeviceSelected;

  const PickerDevice({Key? key, required this.onDeviceSelected}) : super(key: key);

  @override
  State<PickerDevice> createState() => _PickerDeviceState();
}

class _PickerDeviceState extends State<PickerDevice> {
  int _deviceConsumption = 500;

  void _incrementConsumption() {
    setState(() {
      _deviceConsumption++;
      widget.onDeviceSelected(_deviceConsumption);
    });
  }

  void _decrementConsumption() {
    setState(() {
      _deviceConsumption--;
      widget.onDeviceSelected(_deviceConsumption);
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
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Device Consumption",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xff009589),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _incrementConsumption,
                child: Container(
                  margin: const EdgeInsets.only(left: 70),
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
                    child: NumberPicker(
                      value: _deviceConsumption,
                      minValue: 0,
                      maxValue: 1000,
                      step: 1,
                      itemHeight: 40,
                      itemWidth: 80,
                      axis: Axis.vertical,
                      onChanged: (value) {
                        setState(() {
                          _deviceConsumption = value;
                          widget.onDeviceSelected(_deviceConsumption);
                        });
                      },
                      textStyle: TextStyle(
                        color: const Color.fromARGB(50, 0, 137, 149),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      selectedTextStyle: TextStyle(
                        fontSize: 20,
                        color: const Color(0xff009589),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: _decrementConsumption,
                child: const Icon(
                  Icons.remove,
                  size: 25,
                  color: Color(0xff009589),
                ),
              ),
              const SizedBox(width: 20),
              const Text(
                "W",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff009589),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
