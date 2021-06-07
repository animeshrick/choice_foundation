import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/aboutUsModel.dart';
import 'package:info_edu_app_121698/model/banner.dart';
import 'package:info_edu_app_121698/model/buttonImages.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/view/drawerPages/Cources/courses.dart';
import 'package:info_edu_app_121698/view/drawerPages/serviceDetails.dart';
import 'package:info_edu_app_121698/view/drawerPages/studentForm.dart';

import 'drawerPages/applyFranchise.dart';
import 'drawerPages/bridal.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   _getAboutUs();
    // });
    _getAboutUs();
    _getBannerImages();
    _buttonImages();
  }

  var result = Data(title: '', description: '', image: '').obs;
  var _bannerList = <BannerImageData>[].obs;
  var _btnImageList = <ButtomImageData>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: drawer(),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.35.sh,
                  width: 1.sw,
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          CachedNetworkImage(
                            width: 1.sw,
                            imageUrl: '${_bannerList[index].image}',
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) =>
                                Text("Image have problem"),
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          Center(
                            child: customText(
                                '${_bannerList[index].description}',
                                white,
                                25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                    itemCount: _bannerList.length,
                    fade: 0.2,
                    pagination: new SwiperPagination(),
                    control: SwiperControl(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0.02.sh, 20, 0),
                  child: Column(
                    children: [
                      /// ---- apply frenchise /student application/
                      /// ----- service details/course details
                      GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: _btnImageList.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                if (_btnImageList[i].id == 1) {
                                  Get.to(() => ApplyFranchise());
                                } else if (_btnImageList[i].id == 2) {
                                  Get.to(() => StudentForm());
                                } else if (_btnImageList[i].id == 3) {
                                  Get.to(() => ServiceDetails());
                                } else if (_btnImageList[i].id == 4) {
                                  Get.to(() => Courses());
                                }
                              },
                              child: Card(
                                  elevation: 5,
                                  shadowColor: black,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: '${_btnImageList[i].image}',
                                          fit: BoxFit.fill,
                                          height: 0.15.sh,
                                          errorWidget: (context, url, error) =>
                                              Text("error"),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  CircleAvatar(
                                            radius: 60,
                                            backgroundImage: imageProvider,
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        customText('${_btnImageList[i].name}',
                                            black, 15.0,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => Get.to(() => Bridal()),
                        child: SizedBox(
                          width: 1.sw,
                          height: 0.25.sh,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.dstATop),
                                image: NetworkImage(bridalImg),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: black,
                                  blurRadius: 16.0, // soften the shadow
                                  spreadRadius: 7.0, //extend the shadow
                                  offset: Offset(
                                    5.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: customText(
                                    "AR Beautician 🌹 Make-up Artist Booking",
                                    white,
                                    20.0),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Divider(
                            height: 10,
                            color: black,
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${result.value.title}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Divider(
                            color: black,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      customText('${result.value.description}', black, 16.0),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _getAboutUs() async {
    result.value = (await networkcallService.getAboutUs())!;
  }

  void _getBannerImages() async {
    _bannerList.value = (await networkcallService.getBannerAPICall())!;
  }

  void _buttonImages() async {
    _btnImageList.value = (await networkcallService.getButtonImagesAPICall())!;
  }
}
