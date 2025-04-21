import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_training/views/components/no_training.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../data_provider/api_client.dart';

class ListTrainingScreen extends StatefulWidget {
  const ListTrainingScreen({super.key});

  @override
  State<ListTrainingScreen> createState() => _ListTrainingScreenState();
}

class _ListTrainingScreenState extends State<ListTrainingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getTrainings() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "new/training-services/list?page_size=10&page=1",
      method: Method.GET,
      callback: (response,success){
        ViewUtil.hideLoader();
        if(success){}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          GlobalHeaderWidget(
            title: "Listing Trainings",
          ),
          const Expanded(
            child: Center(
              child: NoTraining(),
            ),
          )
        ],
      ),
    );
  }
}
