import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/regDetails.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegDetails extends StatefulWidget {
  @override
  _RegDetailsState createState() => _RegDetailsState();
}

class _RegDetailsState extends State<RegDetails> {
  final ScrollController controller = ScrollController();
  var _detailsList = <RegisterData>[].obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _getGetDetailsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      controller: controller,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
              title: Text('Registation Details'),
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
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText('Choice Foundation Registation Details', black, 20,
                  fontWeight: FontWeight.bold),
              Obx(() => SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 1.sw,
                    child: ListView.separated(
                        primary: false,
                        // shrinkWrap: true,
                        itemBuilder: (_, int i) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    '${i+1}. ${_detailsList[i].description}',
                                    black,
                                    16),
                              ],
                            ),
                        separatorBuilder: (_, __) => SizedBox(
                              height: 15,
                            ),
                        itemCount: _detailsList.length),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  void _getGetDetailsList() async {
    showProgress(context);
    _detailsList.value = (await networkcallService.getRegDetailsAPICall())!;
    hideProgress(context);
  }
}
