import 'package:flutter/material.dart';
import 'package:larix/screens/main/dashboard/widgets/profile_pic_with_active_status.dart';

import '../../../../utils/constant.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key? key,
    required this.image,
    required this.userConnected,
    required this.userName,
    required this.userRole,
  }) : super(key: key);

  final String image;
  final bool userConnected;
  final String userName;
  final String userRole;

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
            const Icon(Icons.menu),
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
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userRole,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 123, 120, 120),
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
