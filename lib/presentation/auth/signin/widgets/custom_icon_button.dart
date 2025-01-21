import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final void Function()? onTap;
  const CustomIconButton({
    super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: const Color(0xff6938EF),
          ),
          borderRadius: BorderRadius.circular(40)),
      width: 360,
      child: Center(
        child: Padding(padding: const EdgeInsets.only(left: 50,top: 15,bottom: 15),
        child: Row(
          
          children: [
            // icon
             icon,
            const SizedBox(
              width: 10,
            ),
            // text
            Text(
              title,
              style: TextStyle(
                  color: const Color(0xff6938EF),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        ),
      ),
    ),
    );
  }
}
