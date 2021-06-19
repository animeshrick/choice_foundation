import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/membersModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Members extends StatefulWidget {
  const Members({Key? key}) : super(key: key);

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  var membersList = <MemberData>[].obs;
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _getMembers();
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
                    title: Text('Members'),
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
                      child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (_, int i) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CachedNetworkImage(
                                    imageUrl: '${membersList[i].image}',
                                    errorWidget: (context, url, error) =>
                                        Text("error"),
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 120,
                                      backgroundImage: imageProvider,
                                    ),
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Name : ${membersList[i].name}'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Desig : ${membersList[i].designation}'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          launch('${membersList[i].facebook}');
                                        },
                                        child: Image.network(
                                          'https://image.flaticon.com/icons/png/512/20/20673.png',
                                          height: 0.07.sh,
                                          width: 0.07.sw,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launch('${membersList[i].instagram}');
                                        },
                                        child: Image.network(
                                          'https://image.flaticon.com/icons/png/512/1384/1384031.png',
                                          height: 0.07.sh,
                                          width: 0.07.sw,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launch('${membersList[i].twitter}');
                                        },
                                        child: Image.network(
                                          'https://image.flaticon.com/icons/png/512/733/733635.png',
                                          height: 0.07.sh,
                                          width: 0.07.sw,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(
                                height: 10,
                              ),
                          itemCount: membersList.length),
                    ))))));
  }

  void _getMembers() async {
    showProgress(context);
    membersList.value = (await networkcallService.getMembers())!;
    hideProgress(context);
  }
}
