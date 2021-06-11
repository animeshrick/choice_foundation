import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/gallery.dart';
import 'package:info_edu_app_121698/utils/const.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  var _imageList = <GalleryData>[].obs;

  @override
  void initState() {
    super.initState();
    _galleryImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leadingWidth: 45,
                  leading: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                        backgroundColor: white,
                        // radius: 15,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: red,
                              size: 20,
                            ))),
                  ),
                  pinned: true,
                  expandedHeight: 150.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('Gallery'),
                    background: Image.asset(
                      appBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Obx(() => Container(
                height: 1.sh,
                width: 1.sw,
                padding: EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: _imageList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0),
                  itemBuilder: (BuildContext context, int index) {
                    print('${_imageList.length}');
                    return InkWell(
                      onTap: () {
                        showFullImage(_imageList[index].image!);
                      },
                      child: Card(
                        child: CachedNetworkImage(
                          width: 1.sw,
                          imageUrl: '${_imageList[index].image}',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              Text("Image have problem"),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    );
                  },
                )))));
  }

  showFullImage(String url) {
    Get.bottomSheet(Container(
      child: CachedNetworkImage(
        width: 1.sw,
        imageUrl: '$url',
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Text("Image have problem"),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
      ),
    ));
  }

  void _galleryImages() async {
    _imageList.value = (await networkcallService.getGalleryAPICall())!;
  }
}
