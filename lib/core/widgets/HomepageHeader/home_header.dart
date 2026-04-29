import 'package:first_app/core/widgets/ImageBox/image_box.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_sizing.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizing.paddingSM,
          vertical: AppSizing.paddingXS,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // user + text
            Row(
              spacing: 10,
              children: [
                ImageBox.network("https://i.pravatar.cc/150?img=12"),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Charles!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // right side
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  // national flag
                  child: Image.network(
                    "https://flagcdn.com/w40/gb.png",
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
