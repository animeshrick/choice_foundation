import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/centersModel.dart';
import 'package:info_edu_app_121698/model/technicalSearch.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NonTechnicalCenters extends StatefulWidget {
  @override
  _NonTechnicalCentersState createState() => _NonTechnicalCentersState();
}

class _NonTechnicalCentersState extends State<NonTechnicalCenters> {
  TextEditingController searchCtrl = TextEditingController();
  var _nontechData = CenterModel(
          technicalCenterData: [],
          nontechnicalCenterData: [],
          msg: '',
          responseCode: 1)
      .obs;
  var _searchData = <SearchData>[].obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      nontechnicalCenters();
      nontechnicalSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      var data = _nontechData.value.nontechnicalCenterData;
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: searchCtrl,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {
                        nontechnicalSearch();
                      },
                      icon: Icon(Icons.search)),
                  hintText: "Search your need ......... ",
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchCtrl.clear();
                      _searchData.clear();
                    },
                    icon: Icon(Icons.clear, color: red),
                  ),
                ),
              ),
            ),
            if (_searchData.length == 0)
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                            color: orange,
                            height: 30,
                            width: 0.98.sw,
                            child: Text(
                              '${data[index].centerName}',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customText(
                                  '${data[index].address}', black, 14.0)),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            if (_searchData.length != 0)
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: _searchData.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                            color: orange,
                            height: 30,
                            width: 0.98.sw,
                            child: Text(
                              '${_searchData[index].centerName}',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customText('${_searchData[index].address}',
                                  black, 14.0)),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      );
    }));
  }

  void nontechnicalSearch() async {
    showProgress(context);
    _searchData.value = (await networkcallService.getNonTechSearchApiCall(
        searchItem: searchCtrl.text))!;
    nontechnicalCenters();
    hideProgress(context);
  }

  void nontechnicalCenters() async {
    showProgress(context);
    _nontechData.value = (await networkcallService.getCenters())!;
    hideProgress(context);
  }
}
