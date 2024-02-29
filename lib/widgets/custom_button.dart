import 'package:flutter/material.dart';
import 'package:note_app/utils/colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.backgroundColor,
      this.titleColor})
      : super(key: key);

  final String title;
  final void Function() onTap;
  final Color? backgroundColor;
  final Color? titleColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 60,
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.primaryColors,
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Center(
          child: Text(
            widget.title,
            style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

        ),
      ),
    );
  }
}