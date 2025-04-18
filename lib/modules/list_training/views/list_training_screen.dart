import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_training/views/components/no_training.dart';
import 'package:flutter/material.dart';

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

  // Future<void> getTrainings() async {
  //   ViewUtil.showLoaderPage();
  //   await ApiClient().request(
  //     url: url,
  //     method: method,
  //     callback: (response,success){
  //       ViewUtil.hideLoader();
  //     },
  //   );
  //}

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
