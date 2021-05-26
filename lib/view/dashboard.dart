import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                // Image.asset(img1),
                SizedBox(
                  height: 0.3.sh,
                  width: 1.sw,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        img1,
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 3,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                  ),
                ),
                Positioned(
                  top: 150,
                  right: 1,
                  left: 1,
                  child: CircleAvatar(
                    radius: 0.2.sw,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 0.15.sw,
                      child: Image.asset(imgLogo),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0.17.sh, 20, 0),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Divider(
                        height: 10,
                        color: Colors.black,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'About us',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(aboutUsText),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Divider(
                        height: 10,
                        color: Colors.black,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Certification',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset(
                          img1,
                          height: 0.2.sh,
                          width: 0.2.sh,
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          img1,
                          height: 0.2.sh,
                          width: 0.2.sh,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
