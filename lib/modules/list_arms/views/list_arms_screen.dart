import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_arms/views/components/list_arms.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

import 'components/list_no_arms.dart';

class ListArmsScreen extends StatelessWidget {
  const ListArmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          GlobalHeaderWidget(
            title: "Listing Arms",
          ),
          Expanded(
            child: Center(
              child: ListArms(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: () {
          Navigation.push(
            appRoutes: AppRoutes.listArmsForm,
          );
        },
        buttonText: "List Arms",
      ),
    );
  }
}
