import 'package:flutter/material.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/configuration/mobikul_theme.dart';
import 'package:uv_desk_flutter_open_source/mobikul-uvdesk/constants/app_constants.dart';


class Loader extends StatelessWidget {
  final String? loadingMessage;

  const Loader({Key? key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage ?? '',
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: AppSizes.size24,
              color: MobikulTheme.accentColor,
            ),
          ),
          const SizedBox(height: AppSizes.size24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color?>(
              Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
