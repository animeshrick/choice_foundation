import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/termsAndConditions.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  final ScrollController controller = ScrollController();

  var result = TcModel(
          msg: '',
          responseCode: 1,
          termsData: TermsData(description: '', title: ''))
      .obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _getTC();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            controller: controller,
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
                    title: Text('Terms and Conditions'),
                    background: Image.asset(
                      appBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Obx(() => SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                    child: SizedBox(
                        width: 1.sw,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                '${result.value.termsData.title}', black, 20,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              height: 20,
                            ),
                            customText('${result.value.termsData.description}',
                                black, 16)
                          ],
                        )))))));
  }

  void _getTC() async {
    showProgress(context);
    result.value = (await networkcallService.getTC())!;
    hideProgress(context);
  }
}
