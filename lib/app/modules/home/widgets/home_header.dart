import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 250,
      height: Get.size.height * .35,
      child: Stack(
        children: [
          Container(
            height: Get.size.height * .3,
            width: Get.size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.none,
                image: AssetImage('assets/images/topoCardapio.png'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: Get.size.width,
            child: SizedBox(
              height: Get.size.height * .22,
              child: Image.asset('assets/images/logo.png'),
            ),
          )
        ],
      ),
    );
  }
}
