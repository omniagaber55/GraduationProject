import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';



class SwitchOn_Off extends StatefulWidget {
   final bool status;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final ValueChanged<bool>? onToggle;
  
  const SwitchOn_Off({super.key, required this.status, required this.activeIcon, required this.inactiveIcon, this.onToggle});

  @override
  State<SwitchOn_Off> createState() => _SwitchOn_OffState();
}

class _SwitchOn_OffState extends State<SwitchOn_Off> {
late bool status;

  @override
  void initState() {
    super.initState();
    status = widget.status;
  }

  @override
  void didUpdateWidget(SwitchOn_Off oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.status != oldWidget.status) {
      status = widget.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 200.0,
      height: 55.0,
      toggleSize: 45.0,
      value: status,
      borderRadius: 35.0,
      padding: 3.0,
      activeToggleColor: Colors.white,
      inactiveToggleColor: Colors.white,
      activeColor: SecondColor,
      inactiveColor: const Color(0xffE9E9EA),
      activeIcon: Icon(
        widget.activeIcon,
        color: PrimaryColor,
      ),
      inactiveIcon: Icon(
        widget.inactiveIcon,
        color: SecondColor,
      ),
      onToggle: (value) {
        setState(() {
          status = value;
        });
        widget.onToggle?.call(value);
      },
    );
  }
}