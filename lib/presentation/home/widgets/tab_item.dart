import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class TabItem extends StatelessWidget {
  final String title;
  final String count;
  final bool isSelected;
  const TabItem(
      {super.key,
      required this.title,
      required this.count,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color:
                      isSelected ? Colors.white : AppColors.descriptionColor),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          int.parse(count) > 0
              ? FittedBox(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(start: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color:
                            isSelected ? Color(0xffF95555) : Color(0xffD0D5DD),
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      int.parse(count) > 9 ? '9+' : count,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    )),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
