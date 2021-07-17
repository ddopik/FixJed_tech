import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/change_profile_photo_dialog_view.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/model/user_profile_response.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class ProfileSettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  UserProfileResponse _userProfileResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: AppBarBackButton(),
        leadingWidth: 200,
      ),
      body: Container(padding: EdgeInsets.all(20), child: getView()),
    );
  }

  getView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .55,
          height: MediaQuery.of(context).size.height * .2,
          child: AutoSizeText(
            S.current.ProfileSetting,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontSize: text_head_size_2),
          ),
        ),
        Center(
          child: getImageProfileView(),
        )
      ],
    );
  }

  getImageProfileView() {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: (_userProfileResponse?.imageUrl != null)
                ? CustomImageLoader.image(
                    url: _userProfileResponse?.imageUrl ?? '',
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain)
                : Image(
                    image: AssetImage("assets/images/img_profile.jpeg"),
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: boring_green,
                ),
                onPressed: () {
                  changeProfilePhotoDialogView(context: context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
