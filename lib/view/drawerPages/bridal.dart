import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bridal extends StatefulWidget {
  @override
  _BridalState createState() => _BridalState();
}

class _BridalState extends State<Bridal> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController addCtrl = TextEditingController();

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      controller: controller,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leadingWidth: 40,
            leading: CircleAvatar(
                backgroundColor: white,
                // radius: 15,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: red,
                    ))),
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Make-up Artist/\n Beautitian'),
              background: Image.asset(
                appBar,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.3.sh,
              width: 1.sw,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    'https://i.pinimg.com/originals/b0/99/c9/b099c9fbce6d55244096764fdadc47d8.jpg',
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(bridalText, black, 18),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  customText('Select a Makeup Kit', btnColor, 18),
                  SizedBox(
                    height: 0.1.sh,
                    child: Card(
                      color: Color(0xffE8E8E8),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 15),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: 'Lakme Makeup Pro',
                            elevation: 16,
                            icon: Icon(Icons.arrow_drop_down_circle),
                            isExpanded: true,
                            items:
                                <String>['Lakme Makeup Pro', 'Dept2'].map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      customText('Price for your makeup kit -  ', black, 18),
                      customText('Rs.7500', btnColor, 18),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  textField(firstNameController, 'First Name : '),
                  textField(lastNameController, 'Last Name : '),
                  textField(emailController, 'Email Address : '),
                  textField(firstNameController, 'Phone Number : '),
                  textField(addCtrl, 'Enter your Detailed Address : '),
                  SizedBox(
                    height: 20,
                  ),
                  button(() {}, "SUBMIT"),
                  SizedBox(
                    height: 0.05.sh,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
