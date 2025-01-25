import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class TabItem extends StatelessWidget {
  final String title;
  final String count;
  const TabItem({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.descriptionColor
            ),
            overflow: TextOverflow.ellipsis,
            ),

            int.parse(count) > 0 ?  
            FittedBox(
              child: Container(
              margin: const EdgeInsetsDirectional.only(start: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xffD0D5DD),
                shape: BoxShape.circle
              ),

              child: Center(
                child: Text(
                 int.parse(count) > 9 ? '9+': count,
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                 ),
                )
              ),
            ),
            )
            
            
            
            
            : SizedBox.shrink()
        ],
      ),
    );
  }
}
