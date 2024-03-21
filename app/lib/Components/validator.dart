import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';

class validator extends StatelessWidget {
  validator({required this.validate, super.key});
  String validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 10),
      child: Row(
        children: [
          Image.asset("assets/icons/ion_checkmark-sharp.png"),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              validate,
              style: const TextStyle(
                  color: PrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
