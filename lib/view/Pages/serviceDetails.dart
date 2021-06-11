import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/serviceDetailsModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  var data = <ServiceData>[].obs;

  @override
  void initState() {
    super.initState();
    _getServiceDetails();
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
                    title: Text('Service Details'),
                    background: Image.asset(
                      appBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                          'We provide the services bellow :', black, 20.0,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        width: 1.sw,
                        height: 1.sh,
                        child:Obx(()=> ListView.separated(
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (_, int i) {
                              print('length -- ${data.length}');
                              return Row(
                                children: [
                                  customText('${data[i].id} -- ', black, 18.0),
                                  customText(
                                    '${data[i].title}',
                                    black,
                                    18.0,
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (_, __) => SizedBox(
                                  height: 20,
                                ),
                            itemCount: data.length),)
                      ),
                    ],
                  )),
            )));
  }

  void _getServiceDetails() async {
    // showProgress(context);
    data.value = (await networkcallService.getServiceAPICall())!;
    // hideProgress(context);
  }
}
