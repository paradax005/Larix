import 'package:flutter/material.dart';

import '../../../../utils/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.userConnected,
    required this.image,
  }) : super(key: key);

  final bool userConnected;
  final String image;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(image),
          ),
          if (userConnected)
            Positioned(
              top: 3,
              right: 1,
              child: Container(
                height: getProportionateScreenWidth(8),
                width: getProportionateScreenWidth(8),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            )
        ],
      ),
    );
  }
}
