import 'package:custom_stepper/package/core/constants.dart';
import 'package:flutter/material.dart';

class StatusChecker extends StatelessWidget {
  final String Step;
  final String title;
  final String status;
  final statusColor;
  const StatusChecker({
    super.key,
    required this.status,
    this.statusColor,
    required this.Step,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, // Add this line
        children: [
          Text(
            Step,
            textAlign: TextAlign.left,
            style: stepStyle,
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: titleStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Container(
              width: 59,
              height: 20,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 215, 213, 213),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Center(
                  child: Text(status,
                      style: statusColor, textAlign: TextAlign.left)),
            ),
          ),
        ],
      ),
    );
  }
}
