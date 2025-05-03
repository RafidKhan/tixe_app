import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_workouts/views/components/no_workout.dart';

import '../../../global/widget/global_header_widget.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListWorkoutsScreen extends StatelessWidget {
  const ListWorkoutsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Listing Workouts",
          ),
          const Expanded(
            child: Center(
              child: NoWorkout(),
            ),
          )
        ],
      ),
    );
  }
}
