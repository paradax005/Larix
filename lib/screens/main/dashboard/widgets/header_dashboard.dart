import 'package:flutter/material.dart';
import 'package:larix/screens/main/dashboard/widgets/profile_pic_with_active_status.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key? key,
    required this.image,
    required this.userConnected,
    required this.userName,
    required this.userRole,
    required this.drawerColor,
    required this.userNameColor,
    required this.roleColor,
  }) : super(key: key);

  final String image;
  final bool userConnected;
  final String userName;
  final String userRole;
  final Color drawerColor;
  final Color userNameColor;
  final Color roleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.menu,color: drawerColor,),
            Row(
              children: [
                ProfilePic(
                  userConnected: userConnected,
                  image: image,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        color: userNameColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userRole,
                      style: TextStyle(
                        color: roleColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
