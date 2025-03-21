import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_arms/views/components/list_arms.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../controller/list_arms_controller.dart';
import 'components/list_no_arms.dart';

class ListArmsScreen extends StatefulWidget {
  const ListArmsScreen({super.key});

  @override
  State<ListArmsScreen> createState() => _ListArmsScreenState();
}

class _ListArmsScreenState extends State<ListArmsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      final listArmsController =
          context.read(listArmsControllerProvider.notifier);
      listArmsController.getArms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(listArmsControllerProvider);
        return TixeMainScaffold(
          hasAppBar: true,
          body: Column(
            children: [
              const GlobalHeaderWidget(
                title: "Listing Arms",
              ),
              state.arms.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: ListNoArms(),
                      ),
                    )
                  : const ListArms(),
            ],
          ),
        );
      },
    );
  }
}
