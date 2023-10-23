import 'package:custom_stepper/package/core/constants.dart';
import 'package:flutter/material.dart';


class myAppBar extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final bool isEmpty;
  const myAppBar({
    this.isEmpty = false,
    this.title = 'Pankaj Trust',
    this.leadingIcon = const Icon(
      Icons.search,
      color: KwhiteColor,
    ),
    super.key,
    this.trailingIcon = const Icon(
      Icons.notifications_none,
      color: KwhiteColor,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: isEmpty ? Text('') : leadingIcon,
      title: Text(
        isEmpty ? '' : title,
        style: whiteColor,
      ),
      backgroundColor: const Color(0xFF702DE3),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 17),
          child: isEmpty ? Text('') : trailingIcon,
        ),
      ],
    );
  }
}


//for isempty true = no value
//for isempty fasle = pass values